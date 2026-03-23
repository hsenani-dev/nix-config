{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-vim-surround
      substitute-nvim
    ];

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    vimgolf
  ];
}
