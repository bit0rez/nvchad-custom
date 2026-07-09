return {
  { -- Format on save
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "rmagatti/auto-session",
    lazy = false, -- плагин должен работать сразу при старте
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      auto_save = true,
      auto_restore = true,
      auto_create = true,
      suppressed_dirs = {
        "~/", "~/work", "~/Downloads", "/", "~/src", "~/*"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" }, 
    dependencies = {
      -- Optional but recommended for installing servers easily
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
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
    lazy = false,
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
        "hcl",
        "terraform"
      },
    },
  },
  {
   'evanphx/jjsigns.nvim',
      config = function()
        require('jjsigns').setup()
      end
    },
    {
      'Spiegie/jj-conflict-highlight.nvim',
      version = "*",
      config = function()
          require("jj_conflict_highlight").setup({})
      end,
    },
  { "jceb/jiejie.nvim", lazy = false },
  { "rafikdraoui/jj-diffconflicts", lazy = false },
  { "https://tpope.io/vim/fugitive.git", lazy = false },

  -- {
  --   "javiorfo/nvim-soil",
  --   dependencies = { 'javiorfo/nvim-nyctophilia' },
  --   ft = "plantuml",
  --   config = function()
  --     local config = require "configs.nvimsoil"
  --     require('soil').setup(config) end,
  -- },
  -- { "natecraddock/workspaces.nvim",      {} },
  {
    "natecraddock/sessions.nvim",
    config = function()
      local config = require "configs.sessions"
      require('sessions').setup(config)
    end,
    lazy = false
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
      require("go").setup({
        gofmt = "gofumpt",
        luasnip = true,
        lsp_codelens = false, -- Отключает внутренний вызов сломанного автокомплита
      })
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimports()
          require('go.format').gofmt()
        end,
        group = format_sync_grp,
      })
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
  -- {
  --   'mistweaverco/kulala.nvim',
  --   opts = {},
  --   lazy = true
  -- },
  {
    'nanotee/sqls.nvim',
    opts = {},
    lazy = true
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
      require("dbee").setup( --[[optional config]])
    end,
    lazy = false,
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    lazy = false,
    config = true
  },
  -- {
  --   "ravibrock/spellwarn.nvim",
  --   event = "VeryLazy",
  --   config = false,
  -- },
  -- {
  --   'eskalVAR/codex.nvim',
  --   lazy = false,
  --   cmd = {'Cdx'},
  --   opts = {
  --     app_server_cmd = {
  --       'env',
  --       'RUST_LOG=off',
  --       'avito',
  --       '--skip-self-update',
  --       'llm',
  --       'codex',
  --       'app-server'
  --     },
  --     width = 0.48,
  --     personality = 'pragmatic',
  --     -- Keymaps
  --     toggle_key = '<leader>aa',
  --     quit_key = '<C-q>',
  --     send_key = '<CR>',
  --     attach_file_key = '<C-f>',
  --     interrupt_key = '<C-c>',
  --   }
  -- },
  {
    'kkrampis/codex.nvim',
    lazy = false,
    cmd = { 'Codex', 'CodexToggle' }, -- Optional: Load only on command execution
    keys = {
      {
        '<leader>aa', -- Change this to your preferred keybinding
        function() require('codex').toggle() end,
        desc = 'Toggle Codex popup or side-panel',
        mode = { 'n', 't' }
      },
    },
    opts = {
      cmd = {'avito', '--skip-self-update', 'llm', 'codex'},
      keymaps     = {
        toggle = '<leader>aa', -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
        quit = '<C-q>', -- Keybind to close the Codex window (default: Ctrl + q)
      },         -- Disable internal default keymap (<leader>cc -> :CodexToggle)
      border      = 'rounded',  -- Options: 'single', 'double', or 'rounded'
      width       = 0.5,        -- Width of the floating window (0.0 to 1.0)
      height      = 1.0,        -- Height of the floating window (0.0 to 1.0)
      model       = nil,        -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
      autoinstall = false,       -- Automatically install the Codex CLI if not found
      panel       = true,      -- Open Codex in a side-panel (vertical split) instead of floating window
      use_buffer  = false,      -- Capture Codex stdout into a normal buffer instead of a terminal buffer
    },
  },
  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = "make",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     -- add any opts here
  --     -- this file can contain specific instructions for your project
  --     instructions_file = "avante.md",
  --     -- for example
  --     provider = "avito",
  --     providers = {
  --       openai = {
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 16384,
  --         },
  --       },
  --       avito = {
  --         -- Inherits from openai provider settings
  --         __inherited_from = "openai",
  --         endpoint = "http://llm-manager.k.avito.ru/v1",
  --         model = "glm-4.7",
  --       },
  --       deepseek = {
  --         -- Inherits from openai provider settings
  --         __inherited_from = "openai",
  --         endpoint = "https://api.deepseek.com",
  --         api_key_name = "DEEPSEEK_API_KEY", -- Environment variable name for API key
  --         model = "deepseek-coder", -- Specify the desired model
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
}
