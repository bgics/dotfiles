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
      "wezterm"
      "xquartz"
      "spotify"
      "whatsapp"
      "brave-browser"
      "iina"
      "autodesk-fusion"
      "microsoft-teams"
      "skim"
      "kicad"
      "arc"
      "betterdisplay"
      "raycast"
      "utm"
      "ghdl"
    ];

    masApps = {
      "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
    };
  };
}
