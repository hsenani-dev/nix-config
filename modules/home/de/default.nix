{ params, ... }:
{
  imports =
    if params.de.type == "gnome" then
      [
        ./gnome.nix
      ]
    else if params.de.type == "cosmic" then
      [
        ./cosmic.nix
      ]
    else
      [ ];
}
