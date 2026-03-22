{ inputs, flake-parts-lib, ... }:
let
  inherit (flake-parts-lib) mkPerSystemOption;
in
{
  options.perSystem = mkPerSystemOption (
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [
        ./hostparams.nix
      ];

      # test = builtins.listToAttrs (
      #   lib.map (params: {
      #     name = params.machine.name;
      #     value = lib.nixosSystem { };
      #   }) config.hosts
      # );

      config.flake = {
        nixosConfigurations = (
          builtins.listToAttrs (
            lib.map (params: {
              name = params.machine.name;
              value = lib.nixosSystem { };
            }) config.hosts
          )
        );
      };
    }
  );
}
