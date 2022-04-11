local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "html",
      "css",
      "go",
      "c",
      "cpp",
      "rust",
      "yaml",
      "json",
      "Dockerfile",
  },
}

M.nvimtree = {
   git = {
      enable = true,
   },
   view = {
      side = "right",
      width = 20,
   },
}

return M
