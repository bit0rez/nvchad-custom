local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local configs = require "lspconfig.configs"
local lspcfg = require "lspconfig"
local servers = { "ansiblels", "tflint", "clangd", "briefls", "cmake", "rust_analyzer", "puppet", "pylsp", "regols", "sqls", "lua_ls", "terraformls", "tsserver", "yamlls" }

configs.briefls = {
  default_config = {
    cmd = {"briefls"},
    filetypes = {"brief"},
    root_dir = function(fname)
      return util.root_pattern("brief", ".git")(fname)
    end,
    single_file_support = true,
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
  docs = {
    description = [[
    https://stash.msk.avito.ru/projects/GL/repos/briefls/browse
    Language Server Protocol for Brief.
    ]],
    default_config = {
      root_dir = [[root_pattern("brief",".git")]],
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
  cmd_env = { GOPROXY = "https://goproxy.msk.avito.ru|https://proxy.golang.org,direct"},
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

lspcfg.briefls.setup({
    on_attach = lsp_attach,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

