{ ... }:
{
  config.hosts = [
    {
      machine.name = "nixos-home";
      de.type = "cosmic";

      modules = [ ];
    }
    {
      machine.name = "mac-mini";
      machine.system = "aarch64-darwin";
    }
  ];
}
