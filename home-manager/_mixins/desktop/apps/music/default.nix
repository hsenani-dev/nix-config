{
  lib,
  pkgs,
  username,
  ...
}:
let
  installFor = [ "henry" ];
  inherit (pkgs.stdenv) isLinux;
in
lib.mkIf (builtins.elem username installFor) {
  home.packages =
    with pkgs;
    [
      youtube-music
    ];
}
