{
  withSystem,
  inputs,
  lib,
  config,
  ...
}:
{

  # Modify nixpkgs once for each system.
  # https://flake.parts/system#approach-2-configure-pkgs-once-in-persystem
  config.perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ ];
        config = {
          allowUnfree = true;
        };
      };
    };

  config.flake.nixosConfigurations = lib.mapAttrs (
    name: params:
    lib.nixosSystem {

      specialArgs = {
        inherit params inputs;
        inherit (params.machine) system;
      };

      modules = [
        # ../nixos
        # This section ensures the same nixpkgs are used for nixos, devshells, and packages
        # https://flake.parts/system#approach-2-configure-pkgs-once-in-persystem
        inputs.nixpkgs.nixosModules.readOnlyPkgs
        (
          { ... }:
          {
            # Use the configured pkgs from perSystem
            nixpkgs.pkgs = withSystem params.machine.system (
              { pkgs, ... }: # perSystem module arguments
              pkgs
            );
          }
        )
      ]
      # Additional modules defined in host.
      ++ params.modules;
    }
  ) config.configurations.hosts;
}
