{
  flake.modules.homeManager.base =
    {
      config,
      ...
    }:
    {
      programs = {
        calibre.enable = true;
      };
    };
}
