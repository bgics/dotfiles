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
    ];

    casks = [
      "ghostty"
      "wezterm"
      "xquartz"
      "spotify"
      "whatsapp"
    ];

    masApps = {
      "Goodnotes 6: AI Notes & Docs" = 1444383602;
    };
  };
}
