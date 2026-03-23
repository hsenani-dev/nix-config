{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./hosts.nix
    ./hostparams.nix
  ];
  flake.nixosConfigurations = (
    builtins.listToAttrs (
      lib.map (params: {
        name = params.machine.name;
        value = lib.nixosSystem {
          inherit (params.machine) system;

          specialArgs = {
            inherit params inputs;
          };

          modules = [
            {
              home-manager = {
                users.${params.user.name} = {

                };
              };
            }
            ../nixos
          ]
          # Additional modules defined in host.
          ++ params.modules;
        };
      }) config.hosts
    )
  );
}
