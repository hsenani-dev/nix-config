{
  flake.modules.nixos.cosmic = { pkgs, ... }: {
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
    services.system76-scheduler.enable = true;

    environment.systemPackages = with pkgs; [
      gnome-themes-extra
      xdg-utils
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-cosmic ];
      config.common.default = [
        "cosmic"
        "gtk"
      ];
    };
  };
}
