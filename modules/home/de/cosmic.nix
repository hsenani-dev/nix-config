{
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    cosmic-ext-applet-caffeine
    cosmic-ext-applet-external-monitor-brightness
    cosmic-ext-applet-minimon
    cosmic-ext-applet-sysinfo
    cosmic-ext-calculator
    cosmic-ext-ctl
    cosmic-ext-tweaks
    gnome-calculator
  ];
}
