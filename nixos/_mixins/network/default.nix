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
    hostName = hostname;
    networkmanager.enable = true;
  };
  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = lib.mkIf config.networking.networkmanager.enable false;

  users.users.${username}.extraGroups = lib.optionals config.networking.networkmanager.enable [
    "networkmanager"
  ];
}
