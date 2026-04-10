{
  flake.modules.homeManager.base =
    { params, ... }:
    {
      home = {
        username = params.user.name;
        homeDirectory = "/home/${params.user.name}";
      };
      programs.nh = {
        clean = {
          enable = true;
          extraArgs = "--keep-since 15d --keep 10";
        };
        enable = true;
        flake = params.machine.flake-location;
      };
    };
}
