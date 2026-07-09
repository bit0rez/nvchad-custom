-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  gopls = {
    cmd = {"gopls", "serve"},
    cmd_env = { GOPROXY = "https://goproxy.msk.avito.ru|https://proxy.golang.org,direct"},
    filetypes = { 'go', 'gomod', 'gowork' },
    root_markers = { 'go.mod', '.git', 'go.work' },
    -- Разрешает запуск для одиночных файлов без go.mod
    single_file_support = true,
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
  },
  -- ansiblels = {},
  -- tflint = {},
  -- clangd = {},
  -- cmake = {},
  rust_analyzer = {},
  -- puppet = {},
  -- pylsp = {},
  regols = {},
  -- sqls = {},
  lua_ls = {},
  -- terraformls = {},
  ts_ls = {},
  yamlls = {},
  briefls = {
    default_config = {
      cmd = {"briefls"},
      filetypes = {'brief'},
      root_dir = function(fname)
        return vim.fs.root(fname, "brief")
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
        root_dir = [[root_pattern("brief")]],
      },
    },
  }
}

-- lsps with default config
for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

