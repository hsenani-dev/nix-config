{
  flake.modules.homeManager.base = {
    programs = {
      fish = {
        enable = true;
        shellInit = ''
          set fish_greeting ""
        '';
      };
      bash.enable = true;
      home-manager.enable = true;
    };
  };
}
