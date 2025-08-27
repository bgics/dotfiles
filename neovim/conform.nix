{pkgs, ...}: {
  package = pkgs.vimPlugins.conform-nvim;
  setupModule = "conform";
  setupOpts = {
    format_on_save = {
      lsp_format = "fallback";
      timeout_ms = 500;
    };

    notify_on_error = false;
    notify_no_formatters = false;

    formatters_by_ft = {
      lua = ["stylua"];
      go = ["gofmt"];
      python = ["ruff_format"];
      nix = ["nixpkgs_fmt"];
      c = ["clang-format"];
      cpp = ["clang-format"];
      rust = ["rustfmt"];
    };

    formatters = {
      "clang-format" = {
        args = ["--style" "google"];
      };
    };
  };
}
