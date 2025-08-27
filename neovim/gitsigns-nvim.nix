{ pkgs, ... }:
{
  package = pkgs.vimPlugins.gitsigns-nvim;
  setupModule = "gitsigns";
  setupOpts = {
    signs = {
      add = { text = "+"; };
      change = { text = "~"; };
      delete = { text = "_"; };
      topdelete = { text = "‾"; };
      changedelete = { text = "~"; };
    };
  };
  after = ''
    vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>', {desc = 'Next Git hunk', buffer = bufnr})
    vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>', {desc = 'Previous Git hunk', buffer = bufnr})
  '';
}
