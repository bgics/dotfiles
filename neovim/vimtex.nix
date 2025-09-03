{ pkgs, ... }:
{
  package = pkgs.vimPlugins.vimtex;
  ft = [ "tex" ];
  after = ''
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_open_on_warning = 0
  '';
}
