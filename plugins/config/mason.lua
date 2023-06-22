 return {
  override_options = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      "json-lsp",
      "gopls",
      "gofumpt",
      "clangd",
      "rust-analyzer",
      "python-lsp-server",

      -- shell
      "shfmt",
      "shellcheck",
    },
  }
 }
