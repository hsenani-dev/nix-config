{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        lutris
        protontricks
        wine64
      ];
    };
}
