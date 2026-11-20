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
      "surfer"
    ];

    casks = [
      "brave-browser"
      "google-chrome"
      "ghostty"
      "xquartz"
      "spotify"
      "whatsapp"
      "iina"
      "microsoft-teams"
      "skim"
      "betterdisplay"
      "raycast"
      "utm"
      "logi-options+"
      "steam"
      "codex"
    ];

    masApps = {
      "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
      "Numbers: Make Spreadsheets" = 361304891;
    };
  };
}
