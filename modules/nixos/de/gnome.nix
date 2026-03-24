{ pkgs, ... }:
{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    bluetooth-battery-meter
    pano
    tiling-shell
    blur-my-shell
    dash-to-dock
    dash-to-panel
    search-light
  ];

  programs.dconf.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    atomix
    epiphany
    geary
    gedit
    gnome-music
    hitori
    iagno
    tali
  ];

  services.gnome.gnome-browser-connector.enable = true;
}
