{ lib, config, ... }:
let
  inherit (lib)
    types
    mkOption
    mkDefault
    ;
in
{
  hostparams = types.submodule {
    options = {
      de.type = mkOption {
        type = types.enum [
          "cosmic"
          "gnome"
        ];
      };

      user = {
        name = mkOption {
          type = types.str;
        };

        display-name = mkOption {
          type = types.str;
        };
      };

      machine = {
        name = mkOption {
          type = types.str;
        };

        system = mkOption {
          type = types.str;
        };

        flake-location = mkOption {
          type = types.str;
        };

        state-version = mkOption {
          type = types.str;
        };
      };
    };

    config = {
      de.type = mkDefault "cosmic";

      machine.system = mkDefault "x86_64-linux";
      machine.flake-location = mkDefault "/home/${config.user.name}/config";
      machine.state-version = "25.11";

      user.name = mkDefault "henry";
      user.display-name = "Henry Senanian";
    };
  };
}
