{ pkgs
, ...
}: {
  vim = {
    treesitter.textobjects.enable = false;

    telescope.enable = true;
    autocomplete.nvim-cmp = {
      enable = true;
      sources = {
        nvim_lsp = "[LSP]";
        buffer = "[Buffer]";
        path = "[Path]";
      };
    };

    statusline.lualine.enable = true;

    mini.ai.enable = true;
    mini.surround.enable = true;

    lsp.enable = true;

    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
        virtual_line = true;
      };
    };

    options = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      mouse = "a";
      signcolumn = "yes";
      clipboard = "unnamedplus";
      wrap = false;
      linebreak = true;
      ignorecase = true;
      smartcase = true;
    };

    extraPackages = with pkgs; [
      ripgrep
      texlab
    ];

    startPlugins = [
      pkgs.vimPlugins.nvim-web-devicons
    ];

    lazy.plugins = {
      "gruvbox-material" = import ./gruvbox-material.nix { inherit pkgs; };
      "nvim-ufo" = import ./nvim-ufo.nix { inherit pkgs; };
      "harpoon2" = import ./harpoon.nix { inherit pkgs; };
      "gitsigns.nvim" = import ./gitsigns-nvim.nix { inherit pkgs; };
      "nvim-autopairs" = import ./nvim-autopairs.nix { inherit pkgs; };
      "conform.nvim" = import ./conform.nix { inherit pkgs; };
      "vimtex" = import ./vimtex.nix { inherit pkgs; };
    };

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        bigfile = { enabled = true; };
        indent = {
          enabled = true;
          animate = {
            enabled = false;
          };
        };
        input = { enabled = true; };
        picker = { enabled = true; };
        quickfile = { enabled = true; };
      };
    };

    lsp.servers = {
      texlab = {
        enable = true;
        cmd = [ "texlab" ];
        filetypes = [ "tex" "bib" ];
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
