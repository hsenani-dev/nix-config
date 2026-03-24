{ params, ... }:
{
  nix = {
    # Run garbage collect every other week
    gc = {
      automatic = true;
      dates = "*-*-1,14,28 00:00:00";
      options = "--delete-older-than 21d";
    };

    settings = {
      auto-optimise-store = true;
      extra-experimental-features = [
        "flakes"
        "nix-command"
      ];
      keep-outputs = true;
      keep-derivations = true;
      trusted-users = [ params.user.name ];
      system-features = [
        "nixos-test"
        "benchmark"
        "big-parallel"
        "kvm"
      ];
    };

  };

}
