{
  config,
  lib,
  ...
}:
let
  deType = config.configurations.hosts.nixos-home.de.type;
in
{
  configurations.hosts.nixos-home.module = {
    imports =
      with config.flake.modules.nixos;
      [
        base
        gaming
      ]
      ++ lib.optionals (deType == "cosmic") [ cosmic ]
      ++ lib.optionals (deType == "gnome") [ gnome ];
  };
}
