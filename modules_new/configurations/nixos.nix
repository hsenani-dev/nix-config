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

  config.flake.nixosConfigurations = lib.mapAttrs (
    name: params:
    lib.nixosSystem {

      modules = [
        params.module
      ];
    }
  ) config.configurations.hosts;
}
