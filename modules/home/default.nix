{ params, config, ... }:
{
  imports = [
    ./pkgs.nix
    ./direnv.nix
    ./git.nix
    ./de
  ];

  config = {
    home = {
      username = params.user.name;
      homeDirectory = "/home/${params.user.name}";
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
