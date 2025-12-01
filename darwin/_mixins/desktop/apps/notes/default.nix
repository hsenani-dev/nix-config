{ lib, username, ... }:
let
  installFor = [
    "henry"
    "henry.senanian"
  ];
in
lib.mkIf (lib.elem username installFor) {
  homebrew = {
    casks = [
      "heynote"
      "joplin"
    ];
  };
}
