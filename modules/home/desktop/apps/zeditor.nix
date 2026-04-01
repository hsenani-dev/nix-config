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
      ];
      userSettings = {
        "buffer_font_family" = "Cascadia Code NF";
        "git_panel" = {
          "tree_view" = false;
        };
        "ui_font_size" = 16;
        "buffer_font_size" = 16;
        "load_direnv" = "shell_hook";
      };
    };
  };
}
