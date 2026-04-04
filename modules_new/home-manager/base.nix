{
  flake.modules.homeManager.base =
    { params, ... }:
    {
      home = {
        username = params.user.name;
        homeDirectory = "/home/${params.user.name}";
      };
      programs.home-manager.enable = true;
    };
}
