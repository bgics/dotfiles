{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty
    wezterm
    evince
  ];
}
