return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
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
        "ruby",
        "hcl"
      },
    },
  },

  { "https://tpope.io/vim/fugitive.git", lazy = false },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = {
          "~/", "~/work", "~/Downloads", "/", "~/src", "~/*"
        },
      }
    end,
    lazy = false
  },
  {
    "javiorfo/nvim-soil",
    config = function()
      require "custom.plugins.config.nvimsoil"
    end
  },
  { "natecraddock/workspaces.nvim",      {} },
  {
    "natecraddock/sessions.nvim",
    config = function()
      local config = require "configs.sessions"
      require('sessions').setup(config)
    end
  },
  {
    "preservim/tagbar",
    lazy = false
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
    lazy = false
  },
  {
    "nvim-neotest/nvim-nio",
    lazy = false
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "ray-x/navigator.lua",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require('navigator').setup()
    end,
    lazy = true,
  },
  {
    'mistweaverco/kulala.nvim',
    opts = {},
    lazy = false
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]])
    end,
    lazy = false,
  },
  {
    "ravibrock/spellwarn.nvim",
    event = "VeryLazy",
    config = true,
  },
}
