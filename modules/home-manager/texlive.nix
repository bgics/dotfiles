{ pkgs, ... }:
{
  home.packages = [
    (pkgs.texliveSmall.withPackages (ps: with ps; [ scheme-full ]))
  ];
}
