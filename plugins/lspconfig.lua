local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local lspcfg = require "lspconfig"
local configs = require "lspconfig/configs"
local servers = { "clangd", "brief", "cmake", "rust_analyzer", "pylsp", "sqls", "terraformls", "tsserver" }

configs.brief = {
  default_config = {
    cmd = {"/home/bit0rez/bin/brief-lsp"},
    filetypes = {"brief"},
    root_dir = util.root_pattern(".git"),
    settings = {},
  },
}


for _, lsp in ipairs(servers) do
  lspcfg[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspcfg.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedwrite = true,
        unusedvariable = true,
      },
      ["formatting.gofumpt"] = true,
      staticcheck = true,
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

