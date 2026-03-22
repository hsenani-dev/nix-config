{ ... }:
{
  perSystem =
    {
      config,
      self',
      pkgs,
      lib,
      ...
    }:
    {
      config.hosts = [
        {
          machine.name = "nixos-home";
          de.type = "cosmic";

          # modules = [ ];
        }
      ];
    };
}
