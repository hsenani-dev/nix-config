{
  description = "Henry's NixOS, nix-darwin and Home Manager Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    # nixos-cli.url = "github:nix-community/nixos-cli";
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:

    inputs.flake-parts.lib.mkFlake { inherit inputs; } rec {
      debug = true;
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      # Needed for external coonsumption.
      flake.flakeModules.default = (inputs.import-tree ./modules);

      imports = [
        flake.flakeModules.default
      ];

      _module.args.rootPath = ./.;
    };
}
