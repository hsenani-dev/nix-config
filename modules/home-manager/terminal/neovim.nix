{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      # catppuccin.nvim.enable = config.programs.neovim.enable;

      programs.neovim = {
        enable = true;

        plugins = with pkgs.vimPlugins; [
          vim-surround
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
    };
}
