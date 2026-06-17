{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        protontricks
        wine64
        lutris
      ];
    };
}
