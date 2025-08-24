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
      "r"
    ];

    casks = [
      "ghostty"
      "wezterm"
      "xquartz"
      "spotify"
      "whatsapp"
      "rstudio@daily"
    ];

    masApps = {
      "Goodnotes 6: AI Notes & Docs" = 1444383602;
    };
  };
}
