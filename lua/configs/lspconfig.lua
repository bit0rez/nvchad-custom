-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "gopls", "ansiblels", "tflint", "clangd", "cmake", "rust_analyzer", "puppet", "pylsp", "regols", "sqls", "lua_ls", "terraformls", "tsserver", "yamlls"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--

local util = require "lspconfig/util"
local configs = require "lspconfig.configs"
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

lspconfig.briefls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = nvlsp.capabilities,
})

lspconfig.gopls.setup({
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
})
