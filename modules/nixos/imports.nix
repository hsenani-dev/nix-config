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
        ++ lib.optionals (params.machine.type == "generic-desktop-x86") [ generic-hw ]
        ++ lib.optionals (params.machine.type == "dell-precision-5690") [ dell-precision-5690-hw ]
        ++ lib.optionals (params.de.type == "cosmic") [ cosmic ]
        ++ lib.optionals (params.de.type == "gnome") [ gnome ]
        ++ lib.optionals (params.gaming.enable) [ gaming ];
    };
}
