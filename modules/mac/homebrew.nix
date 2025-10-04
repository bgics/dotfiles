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
      "iina"
      "microsoft-teams"
      "skim"
    ];

    masApps = {
      "Goodnotes 6: AI Notes & Docs" = 1444383602;
    };
  };
}
