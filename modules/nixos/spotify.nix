{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        spotify
      ];

      # Allows syncing local track with mobile devices
      networking.firewall.allowedTCPPorts = [ 57621 ];

      # Enables discovery Spotify Connect
      networking.firewall.allowedUDPPorts = [ 5353 ];
    };
}
