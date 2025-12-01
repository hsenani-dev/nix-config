{
  lib,
  pkgs,
  username,
  ...
}:
let
  installFor = [
    "henry"
    "henry.senanian"
  ];
in
lib.mkIf (lib.elem username installFor) {
  environment.systemPackages = with pkgs; [
    inkscape
    pika
  ];
}
