{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      programs.neovim.enable = true;
      programs.neovim.defaultEditor = true;

      programs.zsh.enable = true;
      programs.fish.enable = true;

      users.defaultUserShell = pkgs.fish;
    };
}
