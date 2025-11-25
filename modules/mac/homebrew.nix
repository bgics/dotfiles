{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "mas"
      "xterm"
    ];

    casks = [
      "ghostty"
      "wezterm"
      "xquartz"
      "spotify"
      "whatsapp"
      "brave-browser"
      "iina"
      "microsoft-teams"
      "skim"
    ];

    masApps = {
      "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
    };
  };
}
