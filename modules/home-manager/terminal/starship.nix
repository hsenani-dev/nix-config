{
  flake.modules.homeManager.base =
    {
      config,
      lib,
      ...
    }:
    {
      catppuccin.starship.enable = config.programs.starship.enable;

      programs = {
        starship = {
          enable = true;
          enableBashIntegration = config.programs.bash.enable;
          enableFishIntegration = config.programs.fish.enable;
          enableZshIntegration = config.programs.zsh.enable;
          # https://github.com/etrigan63/Catppuccin-starship
          settings = {
            add_newline = false;
            command_timeout = 1000;
            time = {
              disabled = true;
            };
            format = lib.concatStrings [
              "[](red)"
              "$os"
              "$username"
              "$sudo"
              "[](bg:sapphire fg:red)"
              "$hostname"
              "[](bg:peach fg:sapphire)"
              "$directory"
              "[](bg:yellow fg:peach)"
              "$git_branch"
              "$git_status"
              "[](fg:yellow bg:green)"
              "$c"
              "$dart"
              "$dotnet"
              "$elixir"
              "$elm"
              "$erlang"
              "$golang"
              "$haskell"
              "$haxe"
              "$java"
              "$julia"
              "$kotlin"
              "$lua"
              "$nim"
              "$nodejs"
              "$rlang"
              "$ruby"
              "$rust"
              "$perl"
              "$php"
              "$python"
              "$scala"
              "$swift"
              "$zig"
              "$package"
              "[](fg:green bg:lavender)"
              "$container"
              "$direnv"
              "$nix_shell"
              "$cmd_duration"
              "$jobs"
              "$shlvl"
              "[ ](fg:lavender)"
              "$character"
            ];
            os = {
              disabled = false;
              style = "bg:red fg:crust";
            };
            os.symbols = {
              AlmaLinux = "";
              Alpine = "";
              Amazon = "";
              Android = "";
              Arch = "󰣇";
              Artix = "";
              CentOS = "";
              Debian = "";
              DragonFly = "";
              EndeavourOS = "";
              Fedora = "";
              FreeBSD = "";
              Garuda = "";
              Gentoo = "";
              Illumos = "";
              Kali = "";
              Linux = "󰌽";
              Macos = "󰀵";
              Manjaro = "";
              Mariner = "";
              Mint = "󰣭";
              NetBSD = "";
              NixOS = "";
              OpenBSD = "";
              openSUSE = "";
              OracleLinux = "󰌷";
              Pop = "";
              Raspbian = "";
              Redhat = "";
              RedHatEnterprise = "";
              RockyLinux = "";
              Solus = "";
              SUSE = "";
              Ubuntu = "󰕈";
              Unknown = "";
              Void = "";
              Windows = "󰖳";
            };
            username = {
              aliases = {
                "${config.home.username}" = "";
                "root" = "󰱯";
              };
              format = "[ $user]($style)";
              show_always = true;
              style_user = "bg:red fg:crust";
              style_root = "bg:red fg:crust";
            };
            sudo = {
              disabled = false;
              format = "[ $symbol]($style)";
              style = "bg:red fg:crust";
              symbol = "󰌋";
            };
            hostname = {
              disabled = false;
              style = "bg:sapphire fg:crust";
              ssh_only = false;
              ssh_symbol = " 󰖈";
              format = "[ $hostname ]($style)[$ssh_symbol]($style)";
            };
            directory = {
              format = "[ $path]($style)[$read_only]($read_only_style)";
              home_symbol = "";
              read_only = " 󰈈";
              read_only_style = "bold bg:peach fg:crust";
              style = "bg:peach fg:crust";
              truncation_length = 3;
              truncation_symbol = "…/";
            };
            # Shorten long paths by text replacement. Order matters
            directory.substitutions = {
              "Apps" = "󰵆";
              "Audio" = "";
              "Crypt" = "󰌾";
              "Desktop" = "";
              "Development" = "";
              "Documents" = "󰈙";
              "Downloads" = "󰉍";
              "Dropbox" = "";
              "Games" = "󰊴";
              "Keybase" = "󰯄";
              "Music" = "󰎄";
              "Pictures" = "";
              "Public" = "";
              "Quickemu" = "";
              "Studio" = "󰡇";
              "Vaults" = "󰌿";
              "Videos" = "";
              "Volatile" = "󱪃";
              "Websites" = "󰖟";
              "nix-config" = "󱄅";
              "Zero" = "󰎡";
            };
            # Languages
            c = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            dart = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            dotnet = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            elixir = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            elm = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            erlang = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            golang = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            haskell = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "󰲒";
            };
            haxe = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            java = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "󰬷";
            };
            julia = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            kotlin = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            lua = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            nim = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            nodejs = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            perl = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            php = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "󰌟";
            };
            python = {
              format = "[[ $symbol( $version)(\(#$virtualenv\)) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            rlang = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            ruby = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            rust = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            scala = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            swift = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            zig = {
              format = "[[ $symbol( $version) ](fg:crust bg:green)]($style)";
              style = "bg:green";
              symbol = "";
            };
            package = {
              format = "[ $version]($style)";
              style = "bg:green";
              version_format = "$raw";
            };
            git_branch = {
              format = "[[ $symbol $branch ](fg:crust bg:yellow)]($style)";
              style = "bg:yellow";
              symbol = "";
            };
            git_status = {
              format = "[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)";
              conflicted = "󰳤 ";
              untracked = " ";
              stashed = " ";
              modified = " ";
              staged = " ";
              renamed = " ";
              deleted = " ";
              typechanged = " ";
              # $ahead_behind is just one of these
              ahead = "󰜹";
              behind = "󰜰";
              diverged = "";
              style = "bg:yellow";
            };
            # "Shells"
            container = {
              format = "[ $symbol $name]($style)";
              style = "bg:lavender fg:crust";
              symbol = "󱋩";
            };
            direnv = {
              disabled = false;
              format = "[ $loaded]($style)";
              allowed_msg = "";
              not_allowed_msg = "";
              denied_msg = "";
              loaded_msg = "󰐍";
              unloaded_msg = "󰙧";
              style = "bg:lavender fg:crust";
              symbol = "";
            };
            nix_shell = {
              format = "[ $symbol]($style)";
              style = "bg:lavender fg:crust";
              symbol = "󱄅";
            };
            cmd_duration = {
              format = "[  $duration]($style)";
              min_time = 2500;
              min_time_to_notify = 60000;
              show_notifications = false;
              style = "bg:lavender fg:crust";
            };
            jobs = {
              format = "[ $symbol $number]($style)";
              style = "bg:lavender fg:crust";
              symbol = "󰣖";
            };
            shlvl = {
              disabled = false;
              format = "[ $symbol]($style)";
              repeat = false;
              style = "bg:lavender fg:crust";
              symbol = "󱆃";
              threshold = 3;
            };
            character = {
              disabled = false;
              format = "$symbol";
              success_symbol = "[❯](bold fg:green)";
              error_symbol = "[❯](bold fg:red)";
              vimcmd_symbol = "[❮](bold fg:green)";
              vimcmd_replace_one_symbol = "[❮](bold fg:lavender)";
              vimcmd_replace_symbol = "[❮](bold fg:lavender)";
              vimcmd_visual_symbol = "[❮](bold fg:yellow)";
            };
          };
        };
      };
    };
}
