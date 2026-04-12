# NixOS System

This is where the magic happens. The `config.configurations.hosts` is a set of of hosts where each host has a `nixosSystem` called on it. Parameters, system, and name for each host and the flake inputs are forwarded to the module imports that is set by module parameter for that particular host. As an example, [nixos-home](../hosts/nixos-home/imports.nix), imports the nixos base module. In addition, it may also import the nixos gaming and cosmic modules if the parameters options are defined as seen in [here](../nixos/imports.nix).

The specialArgs enables the forwarding of arguments to the modules. For instance, the [networking.nix](../nixos/networking.nix) needs the name of the host to define the hostname. The name is given by the key of the `config.configurations.hosts` and set in the specialArgs such that it can be accessed.
