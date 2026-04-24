{
  flake.modules.homeManager.base =
    {
      config,
      ...
    }:
    {
      programs = {
        torrent.enable = true;
      };
    };
}
