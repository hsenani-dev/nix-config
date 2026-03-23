{ params, ... }:
{
  imports =
    if params.de.type == "gnome" then
      [
        ./gnome.nix
      ]
    else if params.de.type == "cosmic" then
      [
        ./cosmic.nix
      ]
    else
      [ ];
  # lib.mkIf
  # (params.machine.de.type == "gnome")
  # ./gnome.nix
  # lib.mkIf
  # (params.machine.de.type == "cosmic")

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
