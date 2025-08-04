{ pkgs, ... }:
let
  rStudio = pkgs.rstudioWrapper.override { packages = with pkgs.rPackages; [ ]; };
in
{
  environment.systemPackages = [
    rStudio
  ];
}
