{
  inputs,
  params,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin
    # inputs.nixos-cli.nixosModules.nixos-cli

    # hardware
    ./machine

    # desktop environment
    ./de
    ./desktop/apps/chromium.nix

    # gaming
    ./gaming

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
    environment.systemPackages = [
      pkgs.chromium
    ];

    users.users.${params.user.name} = {
      isNormalUser = true;
      description = params.user.display-name;
      hashedPassword = params.user.hashedPassword;
      extraGroups = [
        "wheel"
        "dialout"
      ];
    };

    home-manager = {
      users.${params.user.name} = {
        imports = [
          ../home
          inputs.catppuccin.homeModules.catppuccin
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
