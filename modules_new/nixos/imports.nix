{
  config,
  lib,
  ...
}:
{
  flake.modules.nixos.base =
    {
      params,
      inputs,
      ...
    }:
    {
      imports =
        with config.flake.modules.nixos;
        [
          inputs.catppuccin.nixosModules.catppuccin
        ]
        ++ lib.optionals (params.de.type == "cosmic") [ cosmic ]
        ++ lib.optionals (params.de.type == "gnome") [ gnome ]
        ++ lib.optionals (params.gaming.enable) [ gaming ];
    };
}
