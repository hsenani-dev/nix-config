{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    zed-editor
  ];
  programs.chromium.enable = true;
}
