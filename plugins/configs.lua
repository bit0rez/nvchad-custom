local M = {}

M.treesitter = require "custom.plugins.config.treesitter"
M.mason = require "custom.plugins.config.mason"
M.nvimtree = require "custom.plugins.config.nvimtree"

local dap = require "custom.plugins.config.dap"
M.dap = dap.dap
M.dapui = dap.dapui
M.nvmimsoil = {ft = "plantuml"}

return M
