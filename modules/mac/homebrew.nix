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
      "hermes-agent"
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
      "betterdisplay"
      "raycast"
      "utm"
      "logi-options+"
      "steam"
      "balenaetcher"
      "ollama-app"
      "codex"
    ];

    masApps = {
      "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
    };
  };
}
