{
  config,
  ...
}:
{
  catppuccin.zed.enable = config.programs.zed-editor.enable;
  programs = {
    zed-editor = {
      enable = true;
      extensions = [
        "html"
        "toml"
        "nix"
        "git-firefly"
        "catppuccin"
      ];
      userSettings = {
        "buffer_font_family" = "Cascadia Code";
        "git_panel" = {
          "tree_view" = false;
        };
        "ui_font_size" = 16;
        "buffer_font_size" = 15;
        "theme" = {
          "mode" = "system";
          "light" = "Catppuccin Latte";
          "dark" = "Catppuccin Mocha";
        };
        "load_direnv" = "shell_hook";
      };
    };
  };
}
