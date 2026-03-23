{
  params,
  config,
  pkgs,
  inputs,
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
      file.".config/fontconfig/fonts.conf".text = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <match target="font">
            <edit name="antialias" mode="assign">
              <bool>true</bool>
            </edit>
            <edit name="hinting" mode="assign">
              <bool>true</bool>
            </edit>
            <edit name="hintstyle" mode="assign">
              <const>hintslight</const>
            </edit>
            <edit name="rgba" mode="assign">
              <const>rgb</const>
            </edit>
            <edit name="lcdfilter" mode="assign">
              <const>lcddefault</const>
            </edit>
          </match>
        </fontconfig>
      '';
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
      sessionVariables = {
        COLORTERM = "truecolor";
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
        SYSTEMD_EDITOR = "nvim";
        VISUAL = "nvim";
      };
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
    programs = {
      fish = {
        enable = true;
        shellInit = ''
          set fish_greeting ""
        '';
      };
      home-manager.enable = true;
    };
  };
}
