vim.cmd([[
  autocmd TermOpen * startinsert
    noremap <F2> :split<CR>:resize 20<CR>:terminal<CR>
]])

vim.cmd([[
filetype plugin on
augroup FileType go
    noremap <F5> :GoBuild<CR> |
	noremap <F17> :GoDebugStart |
	noremap <F6> :GoRun |
	noremap <F18> :GoRename<CR> |
	noremap <F7> :GoTest<CR> |
	noremap <F19> :GoDebugTest<CR> |
	noremap <F9> :GoDebugBreakpoint<CR> |
	noremap <C-l> :GoReferrers<CR> | 
	noremap <C-L> :GoReferrers<CR> |
	set completeopt-=preview
]])

--[[ Vim-Go debug mappings
 :GoDebugContinue   | (<F5>)
 :GoDebugBreakpoint | (<F9>)
 :GoDebugNext       | (<F10>)
 :GoDebugStep       | (<F11>).
]]--

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

--colorscheme darcula
--highlight ColorColumn ctermbg=23 guibg=lightgrey
vim.opt.foldmethod = "syntax"

-- CtrlSpace
--vim.opt.nocompatible = true -- NOT WORKING
vim.opt.hidden = true
vim.opt.encoding = "utf-8"
--vim.g.CtrlSpaceDefaultMappingKey = "<C-space> "

-- NerdTree
vim.g.NERDTreeQuitOnOpen = 1
vim.NERDTreeShowHidden   = 1
--[["autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimLeave * NERDTreeClose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
]]--

-- Vim-Go
-- let g:go_debug = ["lsp"]
vim.g.go_play_browser_command = "google-chrome-stable %URL% &"
vim.g.go_gopls_enabled = 1
vim.g.go_def_mode="gopls"
vim.g.go_info_mode="gopls"
vim.g.go_fillstruct_mode = "gopls"
vim.g.go_implements_mode = "gopls"
vim.g.go_rename_command = "gopls"
vim.g.go_gopls_gofumpt=1
vim.g.go_highlight_structs = 0
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_parameters = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments = 1
vim.g.go_doc_balloon = 1
vim.g.go_doc_popup_window = 1
vim.g.go_fold_enable = {"block", "import", "varconst", "package_comment"}

-- Nerd commenter
-- Create default mappings
vim.g.NERDCreateDefaultMappings = 1
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1
-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1
-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = "left"
-- Set a language to use its alternate delimiters by default
-- vim.g.NERDAltDelims_java = 1
-- Add your own custom formats or override the defaults
-- vim.g.NERDCustomDelimiters = { "c": { "left": "/**","right": "*/" } }
-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1
-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1
-- Enable NERDCommenterToggle to check all selected lines is commented or not 
vim.g.NERDToggleCheckAllLines = 1


--[[
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
]]--

-- Workspace
--vim.g.workspace_autocreate = 1
--vim.g.workspace_autosave_always = 1
vim.g.workspace_autosave = 1
vim.g.workspace_session_disable_on_args = 1

