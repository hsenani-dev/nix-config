{ withSystem, inputs, config, ... }:
{
  imports = [
    ./hosts.nix
    ./hostparams.nix
  ];
  flake = with inputs.nixpkgs.lib; {
          nixosConfigurations = (
            builtins.listToAttrs (
              map (params: {
                name = params.machine.name;
                value = nixosSystem {
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
                  ]
                  # Additional modules defined in host.
                  ++ params.modules;
                };
              }) config.filteredHosts
            )
          );
  };
}
