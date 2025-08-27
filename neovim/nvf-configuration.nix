{ pkgs
, lib
, ...
}: {
  vim = {
    treesitter.textobjects.enable = false;

    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    statusline.lualine.enable = true;

    mini.ai.enable = true;
    mini.surround.enable = true;

    lsp.enable = true;

    options = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      laststatus = 3;
      mouse = "a";
      termguicolors = true;
      signcolumn = "yes";
      clipboard = "unnamedplus";
      wrap = false;
      linebreak = true;
      ignorecase = true;
      smartcase = true;
    };

    startPlugins = [
      pkgs.vimPlugins.nvim-web-devicons
    ];

    augroups = [
      {
        name = "bhuvansh-lsp-attach";
        clear = true;
      }
    ];

    autocmds = [
      {
        event = [ "LspAttach" ];
        group = "bhuvansh-lsp-attach";
        desc = "Set up LSP keymaps when attaching to buffer";
        callback = lib.generators.mkLuaInline ''
          function(event)
            local map = function(keys, func, mode)
              mode = mode or "n"
              vim.keymap.set(mode, keys, func, { buffer = event.buf })
            end

            map("gd", require("telescope.builtin").lsp_definitions)
            map("gr", require("telescope.builtin").lsp_references)
            map("gI", require("telescope.builtin").lsp_implementations)
            map("<leader>D", require("telescope.builtin").lsp_type_definitions)
            map("<leader>ds", require("telescope.builtin").lsp_document_symbols)
            map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
            map("<leader>rn", vim.lsp.buf.rename)
            map("<leader>ca", vim.lsp.buf.code_action, { "n", "x" })
            map("gD", vim.lsp.buf.declaration)
            map("K", vim.lsp.buf.hover)  -- hover

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
              map("<leader>th", function()
                vim.lsp.inlay_hint.enable(
                  not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
                )
              end)
            end
          end
        '';
      }
    ];

    lazy.plugins = {
      "gruvbox-material" = import ./gruvbox-material.nix { inherit pkgs; };
      "nvim-ufo" = import ./nvim-ufo.nix { inherit pkgs; };
      "harpoon2" = import ./harpoon.nix { inherit pkgs; };
      "gitsigns.nvim" = import ./gitsigns-nvim.nix { inherit pkgs; };
      "nvim-tree.lua" = import ./nvim-tree-lua.nix { inherit pkgs; };
      "nvim-autopairs" = import ./nvim-autopairs.nix { inherit pkgs; };
      "conform.nvim" = import ./conform.nix { inherit pkgs; };
    };

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        bigfile = { enabled = true; };
        dashboard = { enabled = false; };
        explorer = { enabled = false; };
        indent = { enabled = true; };
        input = { enabled = true; };
        picker = { enabled = true; };
        notifier = { enabled = false; };
        quickfile = { enabled = true; };
        scope = { enabled = false; };
        scroll = { enabled = false; };
        statuscolumn = { enabled = false; };
        words = { enabled = false; };
      };
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      clang.enable = true;
      rust.enable = true;
      rust.lsp.opts = ''
        ['rust-analyzer'] = {
          files = {
            excludeDirs = { ".direnv", "target", "build" },
          }
        },
      '';
      go.enable = true;
    };
  };
}
