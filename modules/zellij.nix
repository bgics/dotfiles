{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-material";
      default_layout = "compact";
      default_shell = "nu";
      simplified_ui = true;
      pane_frames = false;
      show_startup_tips = false;
    };
    themes = {
      gruvbox-material = {
        themes = {
          gruvbox-material = {
            fg = "#ddc7a1";
            bg = "#1d2021";
            black = "#3c3836";
            red = "#ea6962";
            green = "#a9b665";
            yellow = "#d8a657";
            blue = "#7daea3";
            magenta = "#d3869b";
            cyan = "#89b482";
            white = "#d4be98";
            orange = "#e78a4e";
          };
        };
      };
    };
  };
}
