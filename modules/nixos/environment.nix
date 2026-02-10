{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty
    google-chrome
    spotify
    evince
    tlp
  ];
}
