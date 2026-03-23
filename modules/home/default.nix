{
  params,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./pkgs.nix
    ./terminal
    ./de
  ];

  config = {
    home = {
      username = params.user.name;
      homeDirectory = "/home/${params.user.name}";
      packages = with pkgs; [
        nerd-fonts.fira-code
        font-awesome
        noto-fonts-color-emoji
        noto-fonts-monochrome-emoji
        symbola
        work-sans
        corefonts
        fira-go
        fira-sans
        lato
        liberation_ttf
        nerd-fonts.space-mono
        nerd-fonts.symbols-only
        source-serif
        ubuntu-classic
        unscii
        cascadia-code
      ];
    };

    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [
            "Source Serif"
            "Noto Color Emoji"
          ];
          sansSerif = [
            "Work Sans"
            "Noto Color Emoji"
          ];
          monospace = [
            "FiraCode Nerd Font Mono"
            "Font Awesome 6 Free"
            "Font Awesome 6 Brands"
            "Symbola"
            "Noto Emoji"
          ];
          emoji = [
            "Noto Color Emoji"
          ];
        };
      };
    };

    # Enable the Catppuccin theme
    catppuccin = {
      accent = "blue";
      flavor = "mocha";
      fish.enable = config.programs.fish.enable;
      zsh-syntax-highlighting.enable = config.programs.zsh.enable;
    };
    programs.home-manager.enable = true;
  };
}
