{ inputs, params, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-cli.nixosModules.nixos-cli
    ./machine
  ];
}
