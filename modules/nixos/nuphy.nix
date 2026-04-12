{
  flake.modules.nixos.base =
    { params, ... }:
    {
      services.udev.extraRules = ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="19f5" GROUP="nuphy", TAG+="uaccess"
      '';
      users.groups.nuphy = { };
      users.users.${params.user.name} = {
        extraGroups = [
          "nuphy"
        ];
      };
    };
}
