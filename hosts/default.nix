{ ... }:
{
  perSystem =
    {
      config,
      self',
      pkgs,
      lib,
      system,
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
