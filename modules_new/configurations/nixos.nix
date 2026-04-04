{
  withSystem,
  inputs,
  lib,
  config,
  ...
}:
{

  config.flake.nixosConfigurations = lib.mapAttrs (
    name: params:
    lib.nixosSystem {

      specialArgs = {
        inherit params inputs;
        inherit (params.machine) system;
      };

      modules = [
        params.module
      ];
    }
  ) config.configurations.hosts;
}
