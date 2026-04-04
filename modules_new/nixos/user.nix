{ ... }:
{
  modules =
    { config, ... }:
    {
      hosts.base = {
        users.users.${config.user.name} = {
          isNormalUser = true;
          description = config.user.display-name;
          hashedPassword = config.user.hashedPassword;
          extraGroups = [
            "wheel"
            "dialout"
          ];
        };
      };
    };
}
