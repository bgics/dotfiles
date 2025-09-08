{ pkgs, ... }:
let
  tcl = import ./tcl.nix { inherit pkgs; };
  tk = import ./tk.nix { inherit pkgs tcl; };
in
pkgs.stdenv.mkDerivation {
  pname = "xcircuit";
  version = "3.8.58";

  src = pkgs.fetchurl {
    url = "http://opencircuitdesign.com/xcircuit/archive/xcircuit-3.8.58.tgz";
    hash = "sha256-dFg7psiSIAWJThpYK594VphBOQteo42S6VuflcedE5c=";
  };

  nativeBuildInputs = with pkgs; [
    xorg.libX11
    xorg.libXt
    cairo
  ];

  NIX_CFLAGS_COMPILE = "-Wno-error=format-security";

  configurePhase = ''
    ./configure --prefix=$out --with-tcl=${tcl} --with-tk=${tk}
  '';

  buildPhase = "make";
  installPhase = "make install";
}
