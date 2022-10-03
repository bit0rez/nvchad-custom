vim.cmd([[
set notitle
]])

-- DAP signs
vim.fn.sign_define('DapBreakpoint', {text='B', texthl='Difftext', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='C', texthl='Difftext', linehl='', numhl=''})

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 100
vim.opt.ts  = 4
vim.opt.sts = 4
vim.opt.sw  = 4
vim.opt.smartindent = true
vim.opt.colorcolumn = "121"
-- For git and debug signs
vim.opt.signcolumn="yes:2"
vim.opt.cmdheight = 2
-- vim.opt.foldmethod = "syntax"
vim.opt.hidden = true
vim.opt.encoding = "utf-8"

vim.cmd([[
augroup FileType protobuf
    set expandtab
    set ts=2
    set sts=2
    set sw=2
]])

-- Vim-Go
-- vim.g.go_debug = "lsp"
-- vim.g.go_play_browser_command = "google-chrome-stable %URL% &"
-- vim.g.go_gopls_enabled = 1
-- vim.g.go_def_mode="gopls"
-- vim.g.go_info_mode="gopls"
-- vim.g.go_fillstruct_mode = "gopls"
-- vim.g.go_implements_mode = "gopls"
-- vim.g.go_rename_command = "gopls"
-- vim.g.go_gopls_gofumpt=1
-- vim.g.go_highlight_structs = 0
-- vim.g.go_highlight_methods = 1
-- vim.g.go_highlight_functions = 1
-- vim.g.go_highlight_function_parameters = 1
-- vim.g.go_highlight_function_calls = 1
-- vim.g.go_highlight_operators = 1
-- vim.g.go_highlight_types = 1
-- vim.g.go_highlight_fields = 1
-- vim.g.go_highlight_build_constraints = 1
-- vim.g.go_highlight_generate_tags = 1
-- vim.g.go_highlight_variable_declarations = 1
-- vim.g.go_highlight_variable_assignments = 1
-- vim.g.go_doc_balloon = 1
-- vim.g.go_doc_popup_window = 1
-- vim.g.go_fold_enable = {} -- {"block", "import", "varconst", "package_comment"}

