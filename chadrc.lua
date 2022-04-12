local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "chadracula",
}

local userPlugins = require "custom.plugins" -- path to table
local pluginConfs = require "custom.plugins.configs"

M.plugins = {
   install = userPlugins,
   default_plugin_config_replace = {
      nvim_treesitter = pluginConfs.treesitter,
      nvim_tree = pluginConfs.nvimtree,
   },
}

lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

return M
