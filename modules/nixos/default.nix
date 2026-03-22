{ withSystem, inputs, ... }:
{
  flake.nixosConfigurations.my-machine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      (
        { pkgs, ... }:
        {
          imports = [
            ./configuration.nix
            inputs.home-manager.nixosModules.home-manager
          ];

          nixpkgs.config.allowUnfree = true;
          nixpkgs.overlays = [ ];
        }
      )
    ];
  };
}
