local fn = vim.fn
local o = vim.o
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local map = vim.keymap.set

--- Packer Bootstrap ---
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end
require('plugins') -- Install Plugins

--- Settings ---
o.number = true -- line numbers
vim.cmd("let g:vim_markdown_folding_disabled = 1")
o.conceallevel = 2
o.textwidth = 120  -- Sets the text with when using gq q
o.spelllang = "en"
--o.completeopt = menu,menuone,noselect
o.termguicolors = true

--- Mapings ---
g.mapleader = " " -- Map leader key

map('n', '<F5>', ':source $HOME/.config/nvim/init.lua<CR>', {noremap = true})
map('v', '<Tab>', '>')
map('v', 'S-<Tab>', '<')

-- Yank and Put from system primayry clipbord.
map('v', 'y', '"+y')
map('v', 'p', '"+p')
map('n', 'y', '"+y')
map('n', 'p', '"+p')
map('v', 'd', '"+d')
map('n', 'dd', '"+dd')
map('n', 'D', '"+D')

--- Autocommand ---
vim.cmd("autocmd BufRead,BufNewFile *.md set filetype=markdown")
vim.cmd("autocmd BufRead,BufNewFile *.org set filetype=org")
vim.cmd("autocmd BufRead,BufNewFile *.groff set filetype=groff")
vim.cmd("autocmd BufRead,BufNewFile *.roff set filetype=roff")
vim.cmd("autocmd BufRead,BufNewFile *.txt set filetype=text")
vim.cmd("autocmd FileType markdown setlocal spell")
vim.cmd("autocmd FileType text setlocal spell")
vim.cmd("autocmd FileType org setlocal spell")
vim.cmd("autocmd FileType groff setlocal spell")
vim.cmd("autocmd FileType roff setlocal spell")
