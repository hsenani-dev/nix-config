{
  withSystem,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixpkgs.nixosModules.readOnlyPkgs
  ];

  config = {
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

    # Use the configured pkgs from perSystem
    flake.modules.nixos.base =
      { config, ... }:
      {
        # nixpkgs.pkgs = withSystem config.machine.system (
        nixpkgs.pkgs = withSystem "x86_64-linux" (
          { pkgs, ... }: # perSystem module arguments
          pkgs
        );
      };
  };
}
