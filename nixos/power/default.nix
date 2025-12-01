{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./disks.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.systemd.enable = true;
  boot.kernelModules = [
    "amdgpu"
    "kvm-amd"
  ];
}
