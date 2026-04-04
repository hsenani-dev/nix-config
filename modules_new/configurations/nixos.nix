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

      modules = [
        params.module
      ];
    }
  ) config.configurations.hosts;
}
