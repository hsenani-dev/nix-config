{
  flake.modules.nixos.base = {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  flake.modules.nixos.gaming = {
    services.pipewire = {
      alsa.support32Bit = true;
    };
  };
}
