return {
  -- [ "fatih/vim-go" ] = {},
  [ "https://tpope.io/vim/fugitive.git" ] = {},
  -- [ "thaerkh/vim-workspace" ] = {},
  [ "natecraddock/workspaces.nvim" ] = {},
  [ "natecraddock/sessions.nvim" ] = {},
  [ "vim-ctrlspace/vim-ctrlspace" ] = {},
  [ "mileszs/ack.vim" ] = { cmd = {"Ack"} },
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
  [ "mfussenegger/nvim-dap" ] = {},
  [ "rcarriga/nvim-dap-ui" ] = {},
  [ "leoluz/nvim-dap-go" ] = {},
  [ "jose-elias-alvarez/null-ls.nvim" ] = {},
  -- Brief syntax addon
  [ "ssh://git@stash.msk.avito.ru:7999/~iamerkulov/brief-vim.git" ] = {},
}

