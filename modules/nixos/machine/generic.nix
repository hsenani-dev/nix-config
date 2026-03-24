{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  config = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = lib.mkDefault 5;
        systemd-boot.consoleMode = "max";
        systemd-boot.memtest86.enable = true;
        timeout = lib.mkDefault 10;
      };

      consoleLogLevel = lib.mkDefault 0;

      kernelParams = [
        "mem_sleep_default=s2idle"
      ];

      plymouth.enable = true;

      initrd = {
        availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
        kernelModules = [ ];
        verbose = false;
      };

      kernelModules = [ "kvm-amd" ];
      kernelPackages = pkgs.linuxPackages_latest;
      extraModulePackages = [ ];
    };

    catppuccin.plymouth.enable = config.boot.plymouth.enable;

    # CPU
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware.enableRedistributableFirmware = true;

    # GPU
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

  };
}
