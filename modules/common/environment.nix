{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    helix
  ];
}
