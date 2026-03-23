{ params, lib, ... }:
{
  imports =
    if params.gaming.enable == true then
      lib.trace "enabling steam" [
        ./steam.nix
      ]
    else
      [ ];
}
