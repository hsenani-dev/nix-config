{
  description = "Henry's NixOS, nix-darwin and Home Manager Configuration";
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };
  outputs =
    inputs:

    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;
      systems = import inputs.systems;

      imports = [
        ./modules/nixos/default.nix
      ];
    };
}
