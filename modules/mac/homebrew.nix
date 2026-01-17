{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [ "chipsalliance/verible" ];

    brews = [
      "mas"
      "verible"
    ];

    casks = [
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
    ];

    masApps = {
      "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
    };
  };
}
