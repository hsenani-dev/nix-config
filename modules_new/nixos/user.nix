{ ... }:
{
  flake.modules = {
    nixos.base =
      { params, ... }:
      {
        users.users.${params.user.name} = {
          isNormalUser = true;
          description = params.user.display-name;
          hashedPassword = params.user.hashedPassword;
          extraGroups = [
            "wheel"
            "dialout"
          ];
        };
      };
  };
}
