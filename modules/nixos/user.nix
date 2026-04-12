{
  flake = {
    meta.owner = {
      email = "henry@sinabi.dev";
      name = "Henry Senanian";
    };

    modules.nixos.base =
      { params, ... }:
      {
        users.users.${params.user.name} = {
          isNormalUser = true;
          description = params.user.display-name;
          hashedPassword = params.user.hashedPassword;
          extraGroups = [
            "wheel"
            "dialout"
            "uaccess"
          ];
        };
      };
  };
}
