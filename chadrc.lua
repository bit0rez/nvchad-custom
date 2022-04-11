local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onedark",
}

local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
   install = userPlugins
}

return M
