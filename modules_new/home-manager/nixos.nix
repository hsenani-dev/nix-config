{
  config,
  inputs,
  ...
}:
{
  flake.modules.nixos.base =
    { params, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        users.${params.user.name} = {
          imports = [
            (
              { osConfig, ... }:
              {
                home.stateVersion = osConfig.system.stateVersion;
              }
            )
            inputs.catppuccin.homeModules.catppuccin
            config.flake.modules.homeManager.base
          ];
        };

        useGlobalPkgs = true;

        useUserPackages = true;

        extraSpecialArgs = {
          inherit inputs params;
          hasGlobalPkgs = true;
        };

        backupFileExtension = "backup";
      };
    };
}
