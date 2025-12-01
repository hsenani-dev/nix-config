{ lib, ... }:
{
  boot.initrd.luks.devices."luks-80722962-4360-44bd-98ac-6a11cc775690".device =
    "/dev/disk/by-uuid/80722962-4360-44bd-98ac-6a11cc775690";

  fileSystems."/" = {
    device = "/dev/mapper/luks-80722962-4360-44bd-98ac-6a11cc775690";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A09D-2089";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/mapper/luks-71f807c7-d640-46a1-b6e1-a9b36743bf9b"; }
  ];
}
