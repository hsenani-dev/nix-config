# Henry's NixOS & Home Manger Configurations

## NixOS

NixOS is configured using the
[dendritic pattern](https://github.com/mightyiam/dendritic) using nix modules
and [flake parts](https://flake.parts/). The dendritic pattern is heavily
inspired by
[Shahar "Dawn" Or (@mightyiam)](https://github.com/mightyiam/infra?tab=readme-ov-file)
while the parameterization of hosts is inspired by
[Emily Barbour (@EmilyTheBarbour)](https://github.com/EmilyTheBarbour/nixos-systems?tab=readme-ov-file).
Ricing inspiration, or more accurately, direct copy-and-paste at times is taken
from [Martin Wimpress (@wimpysword)](https://github.com/wimpysworld/nix-config).
Modules are imported automatically via
[import tree](https://github.com/vic/import-tree). This enables sharing of
modules across configurations and supporting multiple configurations from a
single flake.

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
nh os switch . --hostname <hostname>
```

nh is enabled by the dev shell.

### just file

A [just](https://github.com/casey/just) file is included for ease of
configuration application. To start enter:

```bash
just
```
