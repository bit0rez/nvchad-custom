vim.cmd([[
set notitle
]])

-- DAP signs
vim.fn.sign_define('DapBreakpoint', {text='B', texthl='Difftext', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='C', texthl='Difftext', linehl='', numhl=''})

vim.opt.syntax = true
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
vim.opt.hidden = true
vim.opt.encoding = "utf-8"

-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel  = 99

-- Spell check
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us,ru_ru"

vim.cmd([[
augroup FileType protobuf
    set expandtab
    set ts=2
    set sts=2
    set sw=2
]])

