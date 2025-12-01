{
  lib,
  pkgs,
  username,
  ...
}:
let
  installFor = [ "henry" ];
in
lib.mkIf (lib.elem username installFor) { home.packages = with pkgs; [ libreoffice ]; }
