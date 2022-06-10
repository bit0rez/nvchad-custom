local M = {}

M.general = {
    i = {
        -- Ctrl+Space for autocomplete
        ["<C-Space>"] = { "<C-x><C-o>", "Autocomplete by Ctrl-Space" },
    },
    n = {
        --["<leader>cc"] = {"<cmd> Telescope <CR>"},
        --["<leader>q"] = {"<cmd> q <CR>"},

        -- Tabs
        ["tn"] = { "<cmd> tabnext <CR>", "Goto next tab" },
        ["tp"] = { "<cmd> tabprev <CR>", "Goto prev tab" },
        ["tN"] = { "<cmd> tabnew <CR>", "New tab" },
        ["tc"] = { "<cmd> tabclose <CR>", "Close tab" },
        ["tf"] = { "<cmd> tabfirst <CR>", "Goto first tab" },
        ["tl"] = { "<cmd> tablast <CR>", "Goto last tab" },

        -- NERDTree
        ["<F3>"] = { "<cmd> NERDTreeToggle <CR>", "Toggle NERDTree" },

        -- Find files"
        ["ff"] = { "<cmd> Files <CR>", "Find files" },

        -- Buffers
        ["bf"] = { "<cmd> Buffers <CR>", "Show\\Find buffers" },

        -- Find word under cursor
        --["<C-k>"] = { "<cmd> Ag <C-r>=expand('<cword>')<CR><CR>", "Find word under cursor" },
        --"nmap <C-K> :Ack <C-r>=expand('<cword>'}<CR><CR>
        ["<C-k>"] = {
            function()
                local current_word = vim.call('expand','<cword>')
                vim.cmd("Ag " .. current_word)
            end,
            "Find word under cursor"
        },
        ["<leader>k"] = {
            function()
                local current_word = vim.call('expand','<cword>')
                vim.cmd("Ack " .. current_word)
            end,
            "Find word under cursor"
        },
    }
}

return M
