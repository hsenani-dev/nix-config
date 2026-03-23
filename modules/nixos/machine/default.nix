{ params, ... }:
{
  imports = [
    # lib.mkIf
    # (params.machine.type == "generic-desktop-x86")
    ./generic.nix
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
