{
  flake.modules.homeManager.base =
    {
      config,
      ...
    }:
    {
      programs = {
        transmission.enable = true;
      };
    };
}
