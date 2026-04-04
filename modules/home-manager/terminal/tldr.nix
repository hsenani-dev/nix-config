# Modern Unix `man`
# Use the Rust client for tldr
# https://github.com/tldr-pages/tlrc
{
  flake.modules.homeManager.base =
    {
      pkgs,
      ...
    }:
    {
      home.packages = [
        pkgs.tlrc
      ];
      services = {
        tldr-update = {
          enable = true;
          package = pkgs.tlrc;
        };
      };
    };
}
