{ inputs, params, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-cli.nixosModules.nixos-cli

    # hardware
    ./machine

    # desktop environment
    ./de

    # nix config
    ./nix.nix

    # cli
    ./cli.nix
    ./locale.nix
    ./networking.nix
  ];
}
