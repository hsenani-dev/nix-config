{ config, ... }:
{
  configurations.hosts.nixos-home.module = {
    imports = with config.flake.modules.nixos; [ base ];
  };
}
