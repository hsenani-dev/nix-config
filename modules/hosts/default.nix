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
      system,
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
