# Henry's [NixOS] & [Home Manger] Configurations

## NixOS

< fill in with details of nixos modules and dendritic flake parts and
blalblaasdfjd.>

## Extensible

Bring this in. Add to config.hosts. Voila, new host made.

## Apply

### just file

### nixos commands

## TODOs

1. Ensure nixpkgs are safe. There is a nixos module that makes them readonly.
2. Configure vscode
3. Configure gnome option
4. More catppuccin options
5. Make template.
6. Make helper function for host such that one can just import a module where
   one runs `mkHost` and pass args.
7. Document better.
8. Instead of `modules/hosts` importing `nixos`, then having `nixos` import
   `home`, just have it all imported and use via config.
9. Make a directory importer -> Given a path, return all nix files.
10. Make helper function for host such that one can just import a module where
    one runs `mkHost` and pass args.
