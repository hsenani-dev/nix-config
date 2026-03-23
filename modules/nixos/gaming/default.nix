{ params, lib, ... }:
{
  imports =
    if params.gaming.enable == true then
      [
        ./steam.nix
      ]
    else
      [ ];
}
