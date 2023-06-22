local M = {}

local opts = { noremap=true, silent=true }

M.general = {
    i = {
        -- Ctrl+Space for autocomplete
        ["<C-Space>"] = { "<C-x><C-o>", "Autocomplete by Ctrl-Space" },
    },
    n = {
        ["<leader>cc"] = {"<cmd> Telescope <CR>"},

        -- Tabs
        ["tn"] = { "<cmd> tabnext <CR>", "Goto next tab" },
        ["tp"] = { "<cmd> tabprev <CR>", "Goto prev tab" },
        ["tN"] = { "<cmd> tabnew <CR>", "New tab" },
        ["tc"] = { "<cmd> tabclose <CR>", "Close tab" },
        ["tf"] = { "<cmd> tabfirst <CR>", "Goto first tab" },
        ["tl"] = { "<cmd> tablast <CR>", "Goto last tab" },

        -- Find files
        ["ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },

        -- Buffers
        ["fb"] = { "<cmd> Telescope buffers <CR>", "Show\\Find buffers" },

        -- Find in files
        ["fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

        -- Find word under cursor
        ["<C-k>"] = { "<cmd> Telescope grep_string <CR>", "Find word under cursor" },

        -- Tagbar
        ["tt"] = { "<cmd> TagbarToggle <CR>", "Tagbar toggle" },

        -- LSP
        ["<C-l>"] = {
          function ()
            vim.lsp.buf.references()
          end,
          "References",
          opts,
        },
        ["<F18>"] = {
          function ()
            vim.lsp.buf.rename()
          end,
          "Rename",
          opts,
        },
        ["<S-F6>"] = {
          function ()
            vim.lsp.buf.rename()
          end,
          "Rename",
          opts,
        },
        ["<leader>f"] = {
          function ()
            vim.lsp.buf.format({async = true})
          end,
          "Format",
          opts,
        },
        ["<C-]>"] = {
          function ()
            vim.lsp.buf.definition()
          end,
          "LSP go to definition",
          opts,
        },

        -- DAP
        ["<F7>"] = {
          function ()
            require 'dap'.continue()
          end,
          "DAP continue",
          opts,
        },
        ["<F9>"] = {
          function ()
            require 'dap'.toggle_breakpoint()
          end,
          "DAP toggle breakpoint",
          opts,
        },
        ["<S-F9>"] = {
          function ()
            require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
          end,
          "DAP set breakpoint",
          opts,
        },
        ["<F10>"] = {
          function ()
            require 'dap'.step_over()
          end,
          "DAP step over",
          opts,
        },
        ["<F11>"] = {
          function ()
            require 'dap'.step_into()
          end,
          "DAP step into",
          opts,
        },
        ["<F12>"] = {
          function ()
            require 'dap'.step_out()
          end,
          "DAP step out",
          opts,
        },

        -- стандартные горячие клавиши для работы с диагностикой
        ["<leader>e"] = {
          function ()
            vim.diagnostic.open_float()
          end,
          "Open diagnostic float",
          opts,
        },
        ["[d"] = {
          function ()
            vim.diagnostic.goto_prev()
          end,
          "Prev diagnostic",
          opts,
        },
        ["]d"] = {
          function ()
            vim.diagnostic.goto_next()
          end,
          "Next diagnostic",
          opts,
        },
        ["<leader>q"] = {
          function ()
            vim.diagnostic.setloclist()
          end,
          "Diagnostic list",
          opts
        },
    }
}

return M
