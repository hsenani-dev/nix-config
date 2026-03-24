{ params, ... }:
{
  imports =
    if params.gaming.enable == true then
      [
        ./lutris.nix
      ]
    else
      [ ];
}
