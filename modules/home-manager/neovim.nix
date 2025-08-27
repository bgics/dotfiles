{ nvf, pkgs, ... }:
let
  customNeovim = nvf.lib.neovimConfiguration {
    inherit pkgs;
    modules = [ ../../neovim/nvf-configuration.nix ];
  };
in
{
  home.packages = [ customNeovim.neovim ];
}
