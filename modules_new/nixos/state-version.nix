{ ... }:
{
  flake.modules = {
    nixos.base =
      { params, ... }:
      {
        system.stateVersion = params.machine.state-version;
      };
  };
}
