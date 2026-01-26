{ pkgs, ... }:
let
  tcl = import ../../vlsi/tcl.nix { inherit pkgs; };
  tk = import ../../vlsi/tk.nix { inherit pkgs tcl; };
  xcircuit = import ../../vlsi/xcircuit.nix { inherit pkgs tcl tk; };
  xschem = import ../../vlsi/xschem.nix { inherit pkgs tcl tk; };
  magic = import ../../vlsi/magic.nix { inherit pkgs tcl tk; };
  netgen = import ../../vlsi/netgen.nix { inherit pkgs tcl tk; };
  open_pdks = import ../../vlsi/open_pdks.nix { inherit pkgs magic; };
in
{
  home.packages = [
    # open_pdks
    xcircuit
    # xschem
    # netgen
    # magic
  ];

  # home.sessionVariables = {
  #   PDK_ROOT = "${open_pdks}/share/pdk";
  # };
}
