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
2. Fix readme.
3. Configure vscode
4. Configure gnome option
5. More catppuccin options
6. Make template.
7. Make helper function for host such that one can just import a module where
   one runs `mkHost` and pass args.
8. Document better.
9. Instead of `modules/hosts` importing `nixos`, then having `nixos` import
   `home`, just have it all imported and use via config.
10. Make a directory importer -> Given a path, return all nix files.
11. Make helper function for host such that one can just import a module where
    one runs `mkHost` and pass args.
12. Checkout nh.
13. Checkout does nix need to reboot?
14. Add different config for starship and make it an option.
