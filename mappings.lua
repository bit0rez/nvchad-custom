local M = {}

M.general = {
    i = {
        -- Ctrl+Space for autocomplete
        ["<C-Space>"] = { "<C-x><C-o>", "Autocomplete by Ctrl-Space" },
    },
    n = {
        ["<leader>cc"] = {"<cmd> Telescope <CR>"},
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
        ["ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },

        -- Buffers
        ["fb"] = { "<cmd> Telescope buffers <CR>", "Show\\Find buffers" },

        ["fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

        -- Find word under cursor
        ["<C-k>"] = { "<cmd> Telescope grep_string <CR>", "Find word under cursor" },

        -- Go
        ["<C-l>"] = { "<cmd> GoReferrers<CR>", "Find word under cursor" },
    }
}

return M
