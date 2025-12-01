{
  catppuccinPalette,
  config,
  hostname,
  isInstall,
  isISO,
  isWorkstation,
  inputs,
  lib,
  modulesPath,
  outputs,
  pkgs,
  stateVersion,
  username,
  ...
}:
{
  imports = [
    # Use module this flake exports; from modules/nixos
    #outputs.nixosModules.my-module
    # Use modules from other flakes
    inputs.catppuccin.nixosModules.catppuccin
    inputs.determinate.nixosModules.default
    inputs.disko.nixosModules.disko
    inputs.kolide-launcher.nixosModules.kolide-launcher
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.nix-index-database.nixosModules.nix-index
    (modulesPath + "/installer/scan/not-detected.nix")
    ./${hostname}
    ./_mixins/console
    ./_mixins/hardware
    ./_mixins/network
    ./_mixins/users
  ]
  ++ lib.optional isWorkstation ./_mixins/desktop;

  boot = {
    binfmt = lib.mkIf isInstall {
      emulatedSystems = [
        "riscv64-linux"
      ]
      ++ lib.optionals (pkgs.system == "x86_64-linux") [
        "aarch64-linux"
      ]
      ++ lib.optionals (pkgs.system == "aarch64-linux") [
        "x86_64-linux"
      ];
    };
    consoleLogLevel = lib.mkDefault 0;
    initrd.verbose = false;
    # Only enable the systemd-boot on installs, not live media (.ISO images)
    loader = lib.mkIf isInstall {
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = lib.mkDefault 10;
      systemd-boot.consoleMode = "max";
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      timeout = lib.mkDefault 10;
    };
  };

  catppuccin = {
    accent = catppuccinPalette.accent;
    flavor = catppuccinPalette.flavor;
  };

  # Only install the docs I use
  documentation.enable = true;
  documentation.nixos.enable = false;
  documentation.man.enable = true;
  documentation.info.enable = false;
  documentation.doc.enable = false;

  environment = {
    systemPackages =
      with pkgs;
      [
        inputs.determinate.packages.${pkgs.system}.default
        inputs.fh.packages.${pkgs.system}.default
        git
        just
        micro
        nix-output-monitor
      ]
      ++ lib.optionals isInstall [
        inputs.nixos-needsreboot.packages.${pkgs.system}.default
        nvd
        nvme-cli
        rsync
        smartmontools
      ];

    variables = {
      EDITOR = "micro";
      SYSTEMD_EDITOR = "micro";
      VISUAL = "micro";
    };
  };

  nixpkgs = {
    overlays = [
      # Overlays defined via overlays/default.nix and pkgs/default.nix
      outputs.overlays.localPackages
      outputs.overlays.modifiedPackages
      outputs.overlays.unstablePackages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        extra-experimental-features = "parallel-eval";
        # Disable global registry
        flake-registry = "";
        lazy-trees = true;
        eval-cores = 0; # Enable parallel evaluation across all cores
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
        warn-dirty = false;
      };
      # Disable channels
      channel.enable = false;
      # Make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  programs = {
    command-not-found.enable = false;
    fish = {
      enable = true;
    };
    nano.enable = lib.mkDefault false;
    nh = {
      clean = {
        enable = isInstall;
        extraArgs = "--keep-since 15d --keep 10";
      };
      enable = true;
      flake = "/home/${username}/Zero/nix-config";
    };
    nix-index-database.comma.enable = isInstall;
    nix-ld = lib.mkIf isInstall {
      enable = true;
      libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged
        # programs here, NOT in environment.systemPackages
      ];
    };
  };

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
    };
  };

  # Only enable sudo-rs on installs, not live media (.ISO images)
  security = lib.mkIf isInstall {
    polkit.enable = true;
    sudo.enable = false;
    sudo-rs = {
      enable = lib.mkDefault true;
    };
  };

  system = {
    activationScripts = {
      nixos-needsreboot = lib.mkIf (isInstall) {
        supportsDryActivation = true;
        text = "${
          lib.getExe inputs.nixos-needsreboot.packages.${pkgs.system}.default
        } \"$systemConfig\" || true";
      };
    };
    nixos.label = lib.mkIf isInstall "-";
    inherit stateVersion;
  };
}
