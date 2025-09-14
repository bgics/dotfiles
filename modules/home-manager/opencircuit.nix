{ pkgs, ... }:
let
  tcl = import ../../opencircuit/tcl.nix { inherit pkgs; };
  tk = import ../../opencircuit/tk.nix { inherit pkgs tcl; };
  xcircuit = import ../../opencircuit/xcircuit.nix { inherit pkgs tcl tk; };
  magic = import ../../opencircuit/magic.nix { inherit pkgs tcl tk; };
  netgen = import ../../opencircuit/netgen.nix { inherit pkgs tcl tk; };
  open_pdks = import ../../opencircuit/open_pdks.nix { inherit pkgs magic; };
in
{
  home.packages = [
    open_pdks
    xcircuit
    netgen
    magic
  ];

  home.sessionVariables = {
    PDK_ROOT = "${open_pdks}/share/pdk";
  };
}
