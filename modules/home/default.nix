{ params, ... }:
{
  imports = [
    ./pkgs.nix
    ./direnv.nix
    ./git.nix
  ];
  config = {
    home = {
      username = params.user.name;
      homeDirectory = "/home/${params.user.name}";
    };
    programs.home-manager.enable = true;
  };
}
