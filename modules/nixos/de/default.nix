{ lib, params, ... }:
{
  imports = [
    # lib.mkIf
    # (params.machine.de.type == "gnome")
    # ./gnome.nix
    # lib.mkIf
    # (params.machine.de.type == "cosmic")
    ./cosmic.nix
  ];

  config = {
    nixpkgs.hostPlatform = params.machine.system;

    system.stateVersion = params.machine.state-version;
    home-manager.users.${params.user.name} = {
      config = {
        home.stateVersion = params.machine.state-version;
      };
    };
  };
}
