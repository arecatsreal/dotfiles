local fn = vim.fn
local o = vim.o

--- Packer Bootstrap ---
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end
require('plugins') -- Install Plugins.
require('mapings') -- Load mappings.

--- Settings ---
o.number = true -- line numbers
vim.cmd("let g:vim_markdown_folding_disabled = 1")
o.conceallevel = 2
o.textwidth = 120  -- Sets the text with when using gq q
o.spelllang = "en"
o.termguicolors = true
o.laststatus = 3 -- Global status line
vim.api.nvim_create_user_command('Q', 'bdelete', { nargs = 0 })

--- Auto commands ---
vim.cmd("autocmd FileType zsh set filetype=bash") -- Changes all files with file type "zsh" to "bash".

-- Better detect file types from exertions. 
vim.cmd("autocmd BufRead,BufNewFile *.md set filetype=markdown")
vim.cmd("autocmd BufRead,BufNewFile *.org set filetype=org")
vim.cmd("autocmd BufRead,BufNewFile *.groff set filetype=groff")
vim.cmd("autocmd BufRead,BufNewFile *.roff set filetype=roff")
vim.cmd("autocmd BufRead,BufNewFile *.txt set filetype=text")

-- Auto turn on spell check.
vim.cmd("autocmd FileType markdown setlocal spell")
vim.cmd("autocmd FileType text setlocal spell")
vim.cmd("autocmd FileType org setlocal spell")
vim.cmd("autocmd FileType groff setlocal spell")
vim.cmd("autocmd FileType roff setlocal spell")
