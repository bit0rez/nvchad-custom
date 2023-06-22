local M = {}
M.ui = {
   theme = "chadracula",
}

local pluginConfs = require "custom.plugins.configs"
M.plugins = {
  user = require "custom.plugins",
  override = {
    [ "nvim-treesitter/nvim-treesitter" ] = pluginConfs.treesitter,
    [ "kyazdani42/nvim-tree.lua" ] = pluginConfs.nvimtree,
    [ "williamboman/mason.nvim" ] = pluginConfs.mason,
  },
}

M.mappings = require "custom.mappings"

return M
