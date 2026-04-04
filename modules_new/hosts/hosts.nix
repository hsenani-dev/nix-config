{ config, ... }:
{
  config.configurations.hosts.nixos-home = {
    de.type = "cosmic";
    gaming.enable = true;

    module = {
      imports = with config.flake.modules.nixos; [ base ];
      # fileSystems."/" = {
      #   device = "/dev/disk/by-uuid/f3d40eaf-fa0a-4daa-83f2-6ba0fa0461f3";
      #   fsType = "ext4";
      # };

      # fileSystems."/boot" = {
      #   device = "/dev/disk/by-uuid/005A-48FD";
      #   fsType = "vfat";
      #   options = [
      #     "fmask=0077"
      #     "dmask=0077"
      #   ];
      # };

      # swapDevices = [
      #   { device = "/dev/disk/by-uuid/bff6d01b-be0d-4c85-835f-f11d6b631441"; }
      # ];
    };
  };
}
