{
  flake.modules.homeManager.base =
    {
      config,
      ...
    }:
    {
      home = {
        # https://github.com/direnv/direnv/issues/1084
        sessionVariables = {
          DIRENV_WARN_TIMEOUT = "120s";
        };
      };
      programs = {
        direnv = {
          enable = true;
          nix-direnv = {
            enable = true;
          };
        };
      };
    };
}
