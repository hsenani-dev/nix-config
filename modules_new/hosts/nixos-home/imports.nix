{ config, ... }:
{
  configurations.hosts.nixos-home.module = {
    imports =
      with config.flake.modules.nixos;
      [
        base
        gaming
      ]
      ++ lib.optionals (configurations.hosts.nixos-home.de.type == "cosmic") [ cosmic ];
  };
}
