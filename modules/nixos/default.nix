{ inputs, params, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    # inputs.nixos-cli.nixosModules.nixos-cli

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

  config = {
    # programs.nixos-cli = {
    #   enable = true;
    #   settings = {
    #     config_location = "${params.machine.flake-location}";
    #   };
    # };

    users.users.${params.user.name} = {
      isNormalUser = true;
      description = params.user.display-name;
      extraGroups = [
        "wheel"
        "dialout"
      ];
    };

    home-manager = {
      users.${params.user.name} = {
        imports = [
          ../home
        ];
      };

      useGlobalPkgs = true;

      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs params;
      };

      backupFileExtension = "backup";
    };
  };
}
