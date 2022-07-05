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
      "python",
  },
}

M.nvimtree = {
   git = {
      hl = true,
      enable = true,
   },
   view = {
      side = "right",
      width = 35,
   },
   show_icons = {
        folders = 0,
        files = 1,
        folder_arrows = 1,
   },
   actions = {
        open_file = {
            quit_on_open = true,
        },
   },
}

return M
