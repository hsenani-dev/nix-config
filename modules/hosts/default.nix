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
        # availableSystems = lib.mkOption {
        #   type = lib.types.listOf lib.types.str;
        #   default = systems;
        #   description = "The list of systems defined in the flake.";
        # };
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
