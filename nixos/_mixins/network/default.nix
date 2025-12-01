{
  config,
  hostname,
  isInstall,
  isISO,
  isLaptop,
  isWorkstation,
  lib,
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./ssh
  ]
  ++ lib.optional (builtins.pathExists (./. + "/${hostname}.nix")) ./${hostname}.nix;

  programs.captive-browser = lib.mkIf isLaptop {
    enable = true;
    browser = ''
      env XDG_CONFIG_HOME="$PREV_CONFIG_HOME" ${pkgs.chromium}/bin/chromium --user-data-dir=$HOME/.local/share/chromium-captive --proxy-server="socks5://$PROXY" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost" --no-first-run --new-window --incognito -no-default-browser-check http://neverssl.com
    '';
    interface = "wlan0";
  };

  networking = {
    firewall = {
      enable = true;
    };
    hostName = hostname;
    networkmanager = {
      # A NetworkManager dispatcher script to open a browser window when a captive portal is detected
      dispatcherScripts = [
        {
          source = pkgs.writeText "captivePortal" ''
            #!/usr/bin/env bash
            LOGGER="${pkgs.util-linux}/bin/logger -s -t captive-portal"

            case "$2" in
              connectivity-change)
                $LOGGER "Dispatcher script triggered on connectivity change: $CONNECTIVITY_STATE"
                if [ "$CONNECTIVITY_STATE" == "PORTAL" ]; then
                  $LOGGER "Captive portal detected"
                  USER_ID=$(${pkgs.coreutils}/bin/id -u "${username}")
                  USER_SESSION=$(/run/current-system/sw/bin/loginctl list-sessions --no-legend | ${pkgs.gawk}/bin/awk -v uid="$USER_ID" '$3 == uid {print $1}' | ${pkgs.coreutils}/bin/head -n 1)
                  XDG_RUNTIME_DIR="/run/user/$USER_ID"
                  if [ -z "$USER_SESSION" ]; then
                    $LOGGER "No active session found for user '${username}'"
                    exit 1
                  else
                    $LOGGER "Found session $USER_SESSION for user '${username}'"
                  fi

                  # Get display variables for X11/Wayland
                  DISPLAY=$(/run/current-system/sw/bin/loginctl show-session "$USER_SESSION" -p Display | ${pkgs.coreutils}/bin/cut -d'=' -f 2)
                  WAYLAND_DISPLAY=$(/run/current-system/sw/bin/loginctl show-session "$USER_SESSION" -p Type | ${pkgs.gnugrep}/bin/grep -q "wayland" && \
                    ls -1 $XDG_RUNTIME_DIR | ${pkgs.gnugrep}/bin/grep -m1 "^wayland-[0-9]$" || echo "")
                  # Build environment string based on available display server
                  ENV_VARS="DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR"
                  if [ -n "$DISPLAY" ]; then
                    ENV_VARS="$ENV_VARS DISPLAY=$DISPLAY"
                    $LOGGER "X11: $DISPLAY"
                  fi
                  if [ -n "$WAYLAND_DISPLAY" ]; then
                    ENV_VARS="$ENV_VARS WAYLAND_DISPLAY=$WAYLAND_DISPLAY"
                    $LOGGER "Wayland: $WAYLAND_DISPLAY"
                  fi
                  $LOGGER "Running browser as '${username}'"
                  TIMEOUT_CMD="${pkgs.coreutils}/bin/timeout 30"
                  ${pkgs.util-linux}/bin/runuser -l "${username}" -c "$ENV_VARS $TIMEOUT_CMD ${pkgs.xdg-utils}/bin/xdg-open \"http://neverssl.com\""
                fi
                ;;
              *) exit 0;;
            esac
          '';
          type = "basic";
        }
      ];
      # Use resolved for DNS resolution; tailscale MagicDNS requires it
      dns = "systemd-resolved";
      enable = true;
      wifi.backend = "iwd";
      wifi.powersave = !isLaptop;
      settings.connectivity = lib.mkIf isLaptop {
        uri = "http://google.cn/generate_204";
        response = "";
      };
    };
    # https://wiki.nixos.org/wiki/Incus
    nftables.enable = lib.mkIf config.virtualisation.incus.enable true;
    useDHCP = lib.mkDefault true;
    # Forcibly disable wireless networking on ISO images, as they now use NetworkManager/iwd
    wireless = lib.mkIf isISO {
      enable = lib.mkForce false;
    };
  };

  # Belt and braces disable WiFi power saving
  systemd.services.disable-wifi-powersave =
    lib.mkIf
      (
        lib.isBool config.networking.networkmanager.wifi.powersave
        && config.networking.networkmanager.wifi.powersave
      )
      {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.iw ];
        script = ''
          iw dev wlan0 set power_save off
        '';
      };
  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = lib.mkIf config.networking.networkmanager.enable false;

  users.users.${username}.extraGroups = lib.optionals config.networking.networkmanager.enable [
    "networkmanager"
  ];
}
