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
        nixosConfigurations = lib.mkOption {
          type = lib.types.attrs;
        };
      };

      config = {
        nixosConfigurations = (
          builtins.listToAttrs (
            lib.map (params: {
              name = params.machine.name;
              value = lib.nixosSystem { };
            }) config.filteredHosts
          )
        );
      };
    }
  );
}
