{
  flake.modules.homeManager.cosmic =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        cosmic-ext-applet-caffeine
        cosmic-ext-applet-external-monitor-brightness
        cosmic-ext-applet-minimon
        cosmic-ext-applet-sysinfo
        cosmic-ext-applet-weather
        cosmic-ext-calculator
        cosmic-ext-ctl
        cosmic-ext-tweaks
        gnome-calculator # cosmic calculator is not quite there.
      ];
    };
}
