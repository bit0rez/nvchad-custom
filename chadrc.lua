local M = {}
-- make sure you maintain the structure of `core/default_config.lua` here,
M.ui = {
   theme = "chadracula",
}

--[[
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

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

lspconfig.jedi_language_server.setup {
  cmd = {"jedi-language-server", "--tcp"},}
}
]]

--[[
   options = {
      lspconfig = lspconfig
   }
}

]]

local pluginConfs = require "custom.plugins.configs"
M.plugins = {
  user = require "custom.plugins",
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
   }
}

M.mappings = require "custom.mappings"

return M
