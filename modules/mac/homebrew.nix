{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };
    casks = [
      "ghostty"
      "wezterm"
      "xquartz"
      "spotify"
    ];
  };
}
