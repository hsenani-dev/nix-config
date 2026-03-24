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

  config = {

    system.stateVersion = params.machine.state-version;
    home-manager.users.${params.user.name} = {
      config = {
        home.stateVersion = params.machine.state-version;
      };
    };
  };
}
