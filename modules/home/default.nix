{ params, ... }:
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
    programs.home-manager.enable = true;
  };
}
