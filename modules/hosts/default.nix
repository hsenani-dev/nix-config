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
      options = {
        hosts = lib.mkOption {
          type = lib.types.listOf config.hostparams;
          default = [ ];
          description = "host configuraiton";
        };
      };

      config.flake = {
        nixosConfigurations = {
          builtins.listToAttr [3, 4, 5];
        };
      };
    }
  );
}
