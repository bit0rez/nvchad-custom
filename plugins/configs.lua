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

M.mason = {
  override_options = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      "json-lsp",
      "gopls",
      "gofumpt",
      "clangd",
      "rust-analyzer",
      "python-lsp-server",

      -- shell
      "shfmt",
      "shellcheck",
    },
  }
}

M.nvimtree = {
   git = {
      enable = true,
   },
   view = {
      side = "left",
      width = 35,
   },
   renderer = {
     icons = {
       webdev_colors = true,
       git_placement = "before",
       show = {
         file = true,
         folder = true,
         folder_arrow = true,
         git = true,
       },
       glyphs = {
         default = "",
         symlink = "",
         bookmark = "",
         folder = {
           arrow_closed = "",
           arrow_open = "",
           default = "",
           open = "",
           empty = "",
           empty_open = "",
           symlink = "",
           symlink_open = "",
         },
         git = {
           unstaged = "✗",
           staged = "✓",
           unmerged = "",
           renamed = "➜",
           untracked = "★",
           deleted = "",
           ignored = "◌",
         },
       },
     },
     special_files = { "go.mod", "go.sum", "go.work", "Cargo.toml", "Makefile", "README.md", "readme.md" },
     symlink_destination = true,
   },
   actions = {
        open_file = {
            quit_on_open = true,
        },
   },
}

local dap = require "dap"
local dapui = require "dapui"

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 00.25 },
      },
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = { "repl" },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

M.dap = dap
M.dapui = dapui

local sessions = require "sessions"
sessions.setup({
  session_filepath = "./Session.vim"
})

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.gofumpt,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                  vim.lsp.buf.formatting_sync()
              end,
          })
      end
  end,
})

M.nullls = null_ls

return M
