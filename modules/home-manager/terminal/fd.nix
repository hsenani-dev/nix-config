{
  flake.modules.homeManager.base = {
    programs = {
      fd = {
        enable = true;
        ignores = [
          ".git"
          "__pycache__"
        ];
      };
    };
  };
}
