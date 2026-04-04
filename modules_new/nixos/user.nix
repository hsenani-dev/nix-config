{ ... }:
{
  flake.modules = {
    nixos.base =
      { config, ... }:
      {
        # users.users.${config.user.name} = {
        #   isNormalUser = true;
        #   description = config.user.display-name;
        #   hashedPassword = config.user.hashedPassword;
        #   extraGroups = [
        #     "wheel"
        #     "dialout"
        #   ];
        # };
      };
  };
}
