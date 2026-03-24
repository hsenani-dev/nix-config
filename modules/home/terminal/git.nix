{
  params,
  config,
  ...
}:
{
  catppuccin = {
    delta.enable = config.programs.delta.enable;
    gitui.enable = config.programs.gitui.enable;
  };

  programs = {
    git = {
      enable = true;
      settings.user = {
        email = params.user.email;
        name = params.user.display-name;

        push.autoSetupRemote = true;
      };
      settings = {
        alias = {
          ci = "commit";
          cl = "clone";
          co = "checkout";
          puff = "pull --ff-only";
          purr = "pull --rebase";
          fucked = "reset --hard";
          gsu = "submodule update --init --recursive";
          graph = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
        fetch.prune = true;
        advice = {
          statusHints = false;
        };
        diff = {
          colorMoved = "default";
        };
        push = {
          default = "matching";
        };
        pull = {
          rebase = false;
        };
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        "*.log"
        "*.out"
        ".DS_Store"
        "bin/"
        "dist/"
        ".direnv/"
        "result*"
      ];
    };
    delta = {
      enable = true;
      options = {
        hyperlinks = true;
        line-numbers = true;
        side-by-side = true;
      };
    };
    gitui = {
      enable = true;
    };
  };
}
