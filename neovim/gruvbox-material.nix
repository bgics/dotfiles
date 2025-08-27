{ pkgs, ... }:
{
  package = pkgs.vimPlugins.gruvbox-material;

  after = ''
    vim.cmd.colorscheme 'gruvbox-material'
  '';
}
