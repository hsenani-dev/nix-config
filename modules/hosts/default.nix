{
  inputs,
  flake-parts-lib,
  systems,
  ...
}:
let
  inherit (flake-parts-lib) mkPerSystemOption;
in
{
  imports = [
    ./hostparams.nix
  ];
  options.perSystem = mkPerSystemOption (
    {
      config,
      pkgs,
      lib,
      system,
      ...
    }:
    {
      options = {
        flake.nixosConfigurations = lib.mkOption {
          type = lib.types.attrs;
        };
      };

      config.flake = {
        nixosConfigurations = (
          builtins.listToAttrs (
            lib.map (params: {
              name = params.machine.name;
              value = lib.nixosSystem {
                inherit (params.machine) system;

                specialArgs = {
                  inherit params inputs;
                };

                modules = [
                  {
                    home-manager = {
                      users.${params.user.name} = {

                      };
                    };
                  }
                  ../nixos
                ];
                # Additional modules defined in host.
                # ++ params.modules;
              };
            }) config.filteredHosts
          )
        );
      };
    }
  );
}
