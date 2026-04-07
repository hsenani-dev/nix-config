# Henry's NixOS & Home Manger Configurations

## NixOS

NixOS is configured using the
[dendritic pattern](https://github.com/mightyiam/dendritic) using nix modules
and [flake parts](https://flake.parts/). This enables sharing of modules across
configurations and supporting multiple configurations from a single flake.

## Extensible

Configurations can easily be added by importing a module that defines a host
with the minimum required defintions shown below:

```nix
configurations.hosts.hostname = {
      
      # desktop environment selection
      de.type = "desktop environment";

      modules = [
        {
          # define file systems
          fileSystems."/" = { };

          fileSystems."/boot" = { };
        }
      ];
    };
```

Host module options are available [here](./modules/hosts/hostparams.nix). The
nixos-home folder contains the default host [here](./modules/hosts/nixos-home).

## Apply

Configuration can applied with the command below:

```bash
sudo nixos-rebuild switch --flake $HOME/workspace/nix-config#nixos-home
```

where `$HOME/workspace/nix-config` is the folder contain the flake.nix.

### just file

A [just](https://github.com/casey/just) file is included for ease of
configuration application. To start enter:

```bash
just
```
