{
  flake.modules.nixos.base =
    {
      inputs,
      ...
    }:
    {
      imports = [
        inputs.catppuccin.nixosModules.catppuccin
      ];
    };
}
