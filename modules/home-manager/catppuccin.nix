{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      # Enable the Catppuccin theme
      catppuccin = {
        accent = "blue";
        flavor = "mocha";
        fish.enable = config.programs.fish.enable;
        zsh-syntax-highlighting.enable = config.programs.zsh.enable;
      };
    };
}
