{
  pkgs,
  lib,
  ...
}:
let
  shellAliases = {
    clock = ''${pkgs.tty-clock}/bin/tty-clock -B -c -C 4 -f "%a, %d %b"'';
    dmesg = "${pkgs.util-linux}/bin/dmesg --human --color=always";
    egrep = "${pkgs.gnugrep}/bin/egrep --color=auto";
    fgrep = "${pkgs.gnugrep}/bin/fgrep --color=auto";
    grep = "${pkgs.gnugrep}/bin/grep --color=auto";
    ip = "${pkgs.iproute2}/bin/ip --color --brief";
    lsusb = "${pkgs.cyme}/bin/cyme --headings";
    rsync-copy = "${pkgs.rsync}/bin/rsync --archive --block-size=131072 --human-readable --info=progress2 --inplace --no-compress --partial --stats";
    rsync-mirror = "${pkgs.rsync}/bin/rsync --archive --block-size=131072 --delete --human-readable --info=progress2 --no-compress --inplace --partial --stats";
    speedtest = "${pkgs.speedtest-go}/bin/speedtest-go";
    wormhole = "${pkgs.wormhole-rs}/bin/wormhole-rs";
    weather = "${lib.getExe pkgs.girouette} --quiet";
  };
in
{
  imports = [
    ./bat.nix # Modern Unix `cat`
    ./bottom.nix # Modern Unix `top`
    ./dircolors.nix # Terminal colors
    ./direnv.nix # Modern Unix `env`
    ./eza.nix # Modern Unix `ls`
    ./fastfetch.nix # Modern Unix `neofetch`
    # ./fd.nix # Modern Unix `find`
    ./fzf.nix # Terminal fuzzy finder
    ./git.nix # Terminal Git client
    ./neovim.nix
    ./starship.nix # Modern Unix prompt
    ./tldr.nix # Modern Unix `man`
    ./zoxide.nix # Modern Unix `cd`
  ];
  home = {
    packages = with pkgs; [
      bc # terminal calculator
      cyme # Modern Unix `lsusb`
      dua # Modern Unix `du`
      duf # Modern Unix `df`
      dust # Modern Unix `du`
      file # Terminal file info
      girouette # Modern Unix weather
      gping # Modern Unix `ping`
      hexyl # Modern Unix `hexedit`
      magic-wormhole-rs # Terminal file transfer
      pciutils # Terminal PCI info
      procs # Modern Unix `ps`
      psmisc # Traditional `ps`
      rsync # Traditional `rsync`
      sd # Modern Unix `sed`
      speedtest-go # Terminal speedtest.net
      unzip # Terminal ZIP extractor
      wget # Terminal HTTP client
      wget2 # Terminal HTTP client
      tty-clock # Terminal clock
      usbutils # Terminal USB info
      wavemon # Terminal WiFi monitor
    ];
  };

  programs = {
    bash.shellAliases = shellAliases;
    fish.shellAliases = shellAliases;
    zsh.shellAliases = shellAliases;
  };
}
