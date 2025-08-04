{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty
    google-chrome
    wezterm

    gnomeExtensions.tactile
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.dock-from-dash
    gnomeExtensions.user-themes

    gnome-tweaks

    rstudioWrapper.override
    { packages = [ ]; } # with pkgs.rPackages; 
  ];
}
