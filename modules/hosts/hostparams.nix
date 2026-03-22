{
  lib,
  config,
  system,
  flake-parts-lib,
  ...
}:
let
  inherit (lib)
    types
    mkOption
    mkDefault
    mkIf
    ;
  inherit (flake-parts-lib) mkPerSystemOption;

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
        };

        machine = {
          name = mkOption {
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
            default = "/home/${config.user.name}/home";
          };

          modules = mkOption {
            type = types.listOf types.anything;
            default = [ ];
          };
        };
      };
    }
  );
in
{
  options.perSystem = mkPerSystemOption (
    {
      config,
      pkgs,
      lib,
      system,
      ...
    }:
    {
      options = {
        hosts = mkOption {
          type = types.listOf hostparams;
          default = [ ];
        };
        filteredHosts = mkOption {
          type = types.listOf hostparams;
          default = [ ];
        };
      };

      config.filteredHosts = lib.filter (host: host.machine.system == system) config.hosts;
    }
  );
}
