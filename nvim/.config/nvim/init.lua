-- local fn = vim.fn
local o = vim.o
local cmd = vim.api.nvim_create_user_command

require("colemak") -- Load Colemak rebinds.
require("mapings") -- Load mappings.
require("lazy_init") -- Load plugins.
require("neovide") -- Load Neovide config.
vim.cmd("source $HOME/.config/nvim/vim/autocommands.vim") -- Load Autocommands

require("impatient")

--- Settings ---
vim.cmd.colorscheme("catppuccin")
o.number = true -- Line numbers
o.relativenumber = true -- Relative line numbers
vim.cmd("let g:vim_markdown_folding_disabled = 1")
o.conceallevel = 2
o.textwidth = 120 -- Sets the text with when using gq q
o.tabstop = 2 -- Sets the size of tabs.
o.softtabstop = 2 -- Tabstop but soff...
o.shiftwidth = 2 -- Sets the size of tabs.
o.expandtab = true
o.spelllang = "en"
o.termguicolors = true
o.laststatus = 3 -- Global status line
cmd("Q", "bdelete", { nargs = 0 })

-- Vim Wiki
vim.cmd("let g:vimwiki_list = [{'path': '~/Notes/', 'syntax': 'markdown', 'ext': '.md'}]")
vim.cmd("autocmd FileType vimwiki setlocal filetype=markdown")

cmd("WordCount", "!wc -w %", {}) -- Prints word count of buffer.
cmd("BuffQR", "!echo $(< %) | qrencode -t ansiutf8", {}) -- Makes a qrcode of the buffer.

-- Write As Root
-- cmd('RW', 'w !sudo tee %', {}) -- SUDO
cmd("RW", "w !doas tee %", {}) -- DOAS
