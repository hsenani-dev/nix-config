{
  description = "Henry's NixOS, nix-darwin and Home Manager Configuration";
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    {
      # Generated system configurations
      nixosConfigurations.nix-os = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
        ];
      };
    };
}
