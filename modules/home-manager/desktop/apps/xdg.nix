{
  flake.modules.homeManager.base =
    { config, ... }:
    let
      browser = "chromium-browser.desktop";
    in
    {
      xdg.mimeApps = {
        enable = true;

        associations.added = {
          "x-scheme-handler/about" = browser;
          "x-scheme-handler/unknown" = browser;
        };

        # Pin URL handlers. Electron apps (Slack in particular) call
        # `xdg-settings set default-web-browser` on themselves at startup, which
        # hijacks http/https/text/html and swallows every link the desktop hands
        # them. home-manager writes mimeapps.list read-only, so this stops it.
        defaultApplications = {
          "text/html" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "x-scheme-handler/about" = browser;
          "x-scheme-handler/unknown" = browser;

          # Keep each app's own scheme pointed at itself.
          "x-scheme-handler/zed" = "dev.zed.Zed.desktop";
        };
      };

      # COSMIC reads cosmic-mimeapps.list in preference to mimeapps.list, so it
      # needs the same content or the pin above has no effect on this desktop.
      xdg.configFile."cosmic-mimeapps.list".source = config.xdg.configFile."mimeapps.list".source;
    };
}
