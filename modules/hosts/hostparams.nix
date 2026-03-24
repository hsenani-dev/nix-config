{
  lib,
  ...
}:
let
  inherit (lib)
    types
    mkOption
    mkEnableOption
    ;

  hostparams = types.submodule (
    { config, ... }:
    {
      options = {
        de.type = mkOption {
          type = types.enum [
            "cosmic"
            "gnome"
          ];
          default = "cosmic";
        };

        user = {
          name = mkOption {
            type = types.str;
            default = "henry";
          };

          display-name = mkOption {
            type = types.str;
            default = "Henry Senanian";
          };

          email = mkOption {
            type = types.str;
            description = "Email used to configure git.";
            default = "henry@sinabi.dev";
          };

          hashedPassword = mkOption {
            type = types.str;
            description = "run 'mkpasswd -m sha-512' to generate.";
            default = "$6$bm9TcqHd1XegNVuI$h0Xm0fOnDYHvtMlh51uvF50yHOS9FWgtrxeTH.1QUtrhknpCytdP6xqvuB5/lfrT9f/lIwKOZLhyCXiuNTzWC0";
          };
        };

        machine = {
          name = mkOption {
            description = "hostname";
            type = types.str;
          };

          type =
            let
              machineTypes = [ "generic-desktop-x86" ];
            in
            mkOption {
              type = types.enum machineTypes;
              default = "generic-desktop-x86";
            };

          # TODO: make this an enum of systems.
          system = mkOption {
            type = types.str;
            default = "x86_64-linux";
          };

          state-version = mkOption {
            type = types.str;
            default = "25.11";
          };

          flake-location = mkOption {
            type = types.str;
            default = "/home/${config.user.name}/config";
          };
        };

        gaming = {
          enable = mkEnableOption "enables gaming related applications and services";
        };

        modules = mkOption {
          type = types.listOf types.anything;
          default = [ ];
        };
      };
    }
  );
in
{
  options = {
    hosts = mkOption {
      type = types.listOf hostparams;
      default = [ ];
    };
  };
}
