{ ... }:
{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      devShells.default = pkgs.mkShell {
        name = "dev-shell";
        packages = with pkgs; [
          just
          nixd # Nix language server
          nil
          ruff
          nh
          home-manager
        ];
      };
    };
}
