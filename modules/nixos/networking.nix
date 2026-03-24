{ pkgs, params, ... }:
{
  networking.hostName = params.machine.name;
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  programs.wireshark = {
    enable = true;
    usbmon.enable = true;
    package = pkgs.wireshark;
  };
  users.users.${params.user.name}.extraGroups = [
    "networkmanager"
    "wireshark"
  ];
}
