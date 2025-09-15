{ pkgs, tcl, tk, ... }:
pkgs.stdenv.mkDerivation {
  pname = "xschem";
  version = "1f52d63";

  src = pkgs.fetchgit {
    url = "https://github.com/StefanSchippers/xschem.git";
    rev = "1f52d630f53ba3cd0d2329f810da4847f775dc07";
    hash = "sha256-r/kfWlSHkgOM1G2+mNCkJWtXQHta7rj9ChQ1UFN6XOI=";
  };

  nativeBuildInputs = with pkgs; [
    xorg.libX11
    xorg.libXpm
    xorg.libxcb
    xorg.libXrender
    cairo
    flex
    bison
    libjpeg
    gawk
    makeWrapper
  ] ++ [ tk tcl ];

  configurePhase = ''
    ./configure \
      --prefix=$out \
      /arg/tcl-version=${tcl.version} \
      /arg/tk-version=${tk.version} \
      --prefix/libs/script/tcl=${tcl} \
      --prefix/libs/script/tk=${tk} \
  '';

  buildPhase = "make";
  installPhase = ''
    make install

    wrapProgram $out/bin/xschem \
      --prefix TCLLIBPATH : "${tk}/lib"

  '';
}
