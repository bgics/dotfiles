{ pkgs, ... }:
let
  rstudio = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [ tidyverse here ];
  };
in
{
  environment.systemPackages = with pkgs; [
    vim
    helix
    rstudio
  ];
}
