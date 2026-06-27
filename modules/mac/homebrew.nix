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
      "brave-browser"
      "ghostty"
      "xquartz"
      "spotify"
      "whatsapp"
      "iina"
      "microsoft-teams"
      "skim"
      "arc"
      "betterdisplay"
      "raycast"
      "utm"
      "logi-options+"
      "steam"
      "balenaetcher"
      "codex"
    ];

    masApps = {
      "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
    };
  };
}
