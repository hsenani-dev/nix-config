# Henry's NixOS & Home Manger Configurations

## NixOS

NixOS is configured using the [dendritic pattern](https://github.com/mightyiam/dendritic) using nix modules and [flake parts](https://flake.parts/). This enables sharing of modules across configurations and supporting multiple configurations from a single flake.

## Extensible

Configurations can easily be added by importing a module that defines a host with the minimum required defintions shown below:

``` nix
config.hosts = [
    {
      # hostname
      machine.name = "hostname";
      
      # desktop environment selection
      de.type = "desktop environment";

      modules = [
        {
          # define file systems
          fileSystems."/" = { };

          fileSystems."/boot" = { };
        }
      ];
    }
  ];
```

Host module options are available [here](./modules/hosts/hostparams.nix). The hosts file contains the default host [here](./modules/hosts/hosts.nix).

## Apply

Configuration can applied with the command below:

``` bash
sudo nixos-rebuild switch --flake $HOME/workspace/nix-config#nixos-home
```

where `$HOME/workspace/nix-config` is the folder contain the flake.nix.

### just file

A [just](https://github.com/casey/just) file is included for ease of configuration application. To start enter:

``` bash
just
```

## TODOs

1. Fix readme.
1. Configure vscode
1. More catppuccin options
1. Make template.
1. Make helper function for host such that one can just import a module where
   one runs `mkHost` and pass args.
1. Document better.
1. Instead of `modules/hosts` importing `nixos`, then having `nixos` import
   `home`, just have it all imported and use via config.
1. Make a directory importer -> Given a path, return all nix files.
1. Make helper function for host such that one can just import a module where
    one runs `mkHost` and pass args.
1. Checkout nh.
1. Checkout does nix need to reboot?
1. Add different config for starship and make it an option.
1. Add nix aliases.
1. Add terminal improvements and different terminal than cosmic term.
1. Configure gnome option
