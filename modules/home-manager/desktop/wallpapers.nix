{
  flake.modules.homeManager.base =
    {
      pkgs,
      ...
    }:
    {
      home.packages = [ pkgs.nixos-artwork.wallpapers.catppuccin-mocha ];
    };
}
