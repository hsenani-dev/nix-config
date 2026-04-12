{
  flake.modules.nixos.base = {
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", GROUP="dialout", TAG+="uaccess"
    '';
  };
}
