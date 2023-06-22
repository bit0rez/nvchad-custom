local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local configs = require "lspconfig.configs"
local lspcfg = require "lspconfig"
local servers = { "ansiblels", "tflint", "clangd", "brief", "cmake", "rust_analyzer", "puppet", "pylsp", "regols", "sqls", "terraformls", "tsserver" }

configs.brief = {
  default_config = {
    cmd = {"brief-lsp", "-logs", "/tmp/brief-lsp.log"},
    filetypes = {"brief"},
    root_dir = util.root_pattern(".git", "brief"),
    settings = {},
  },
  docs = {
    description = [[
    http://stash.msk.avito.ru/projects/GL/repos/brief-lsp
    Language Server Protocol for Brief.
    ]],
    default_config = {
      root_dir = [[root_pattern(".git")]],
    },
  },
}

configs.regols = {
  default_config = {
    cmd = {'regols'},
    filetypes = { 'rego' },
    root_dir = util.root_pattern(".git"),
    settings = {}
  },
  docs = {
    description = [[
    https://github.com/kitagry/regols
    Language Server for OPA Rego.
    ]],
    default_config = {
      root_dir = [[root_pattern(".git")]],
    },
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

