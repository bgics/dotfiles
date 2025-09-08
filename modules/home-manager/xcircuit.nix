{ pkgs, ... }:
let
  xcircuit = import ../../xcircuit/xcircuit.nix { inherit pkgs; };
in
{
  home.packages = [
    xcircuit
  ];
}
