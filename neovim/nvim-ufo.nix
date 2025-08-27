{ pkgs, ... }:
{
  package = pkgs.vimPlugins.nvim-ufo;

  after = ''
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local ufo = require("ufo")

    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)

    ufo.setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    }
  '';
}
