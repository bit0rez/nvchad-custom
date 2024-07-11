return {
  [ "https://tpope.io/vim/fugitive.git" ] = {},
  [ "rmagatti/auto-session" ] = {
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = {
          "~/", "~/work", "~/Downloads", "/", "~/src", "~/*"
        },
      }
    end
  },
  [ "aklt/plantuml-syntax" ] = {},
  [ "ellisonleao/glow.nvim" ] = {
    config = function ()
      require("glow").setup()
    end
  },
  [ "edluffy/hologram.nvim" ] = {
    config = function ()
      require('hologram').setup({
        auto_display = true -- WIP automatic markdown image display, may be prone to breaking
      })
    end
  },
  ['https://gitlab.com/itaranto/plantuml.nvim'] = {
    config = function()
      require('plantuml').setup(
        {
          renderer = {
            type = 'image',
            options = {
              prog = 'feh',
              dark_mode = false,
            }
          },
          render_on_write = true,
        }
      )
    end
  },
  -- ["https://github.com/rmagatti/session-lens" ] = {},
  [ "javiorfo/nvim-soil" ] = {
    config = function ()
      require "custom.plugins.config.nvimsoil"
    end
  },
  [ "natecraddock/workspaces.nvim" ] = {},
  [ "natecraddock/sessions.nvim" ] = {
    config = function()
      local config = require "custom.plugins.config.sessions"
      require('sessions').setup(config)
    end
  },
  [ "vim-ctrlspace/vim-ctrlspace" ] = {},
  [ "troydm/easybuffer.vim" ] = {},
  [ "editorconfig/editorconfig-vim" ] = {},
  [ "preservim/tagbar" ] = {},
  [ "KeitaNakamura/neodark.vim" ] = {},
  [ "neovim/nvim-lspconfig" ] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  [ "mfussenegger/nvim-dap" ] = {
    config = function()
      require "custom.plugins.config.dap"
    end,
  },
  [ "rcarriga/nvim-dap-ui" ] = {},
  [ "leoluz/nvim-dap-go" ] = {},
  [ "jose-elias-alvarez/null-ls.nvim" ] = {
    config = function()
      local config = require "custom.plugins.config.nullls"
      require('null-ls').setup(config)
    end
  },
  -- Brief syntax addon
  [ "ssh://git@stash.msk.avito.ru:7999/~iamerkulov/brief-vim.git" ] = {},
}

