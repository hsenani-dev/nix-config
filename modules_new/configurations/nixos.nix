{
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
        inherit name;
      };

      modules = [
        params.module
      ];
    }
  ) config.configurations.hosts;
}
