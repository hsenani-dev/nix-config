{
  withSystem,
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./hosts.nix
    ./hostparams.nix
  ];
  perSystem =
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

  flake.nixosConfigurations = (
    builtins.listToAttrs (
      lib.map (params: {
        name = params.machine.name;
        value = lib.nixosSystem {

          specialArgs = {
            inherit params inputs;
            inherit (params.machine) system;
          };

          modules = [
            ../nixos
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
        };
      }) config.hosts
    )
  );
}
