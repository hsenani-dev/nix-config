{
  flake.modules.nixos.base =
    { params, ... }:
    {
      # Allows reconfiguration of nuphy keyboards on https://www.nuphy.io/en-US
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
