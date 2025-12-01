{
  config,
  hostname,
  lib,
  pkgs,
  username,
  ...
}:
let
  inherit (pkgs.stdenv) isLinux;
in
{
  home = {
    file.".face".source = ./face.png;
  };
  programs = {
    fish.loginShellInit = ''
      ${pkgs.figurine}/bin/figurine -f "DOS Rebel.flf" $hostname
    '';
    git = {
      userEmail = "henry@sinabi.dev";
      userName = "Henry Senanian";
    };
  };
}
