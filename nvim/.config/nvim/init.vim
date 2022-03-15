"Plugin manger
call plug#begin('~/.vimplugins')
"Nvim in the browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Automatic parentheses.
Plug 'jiangmiao/auto-pairs'

"Syntax highlight
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"Theme
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'Mofiqul/dracula.nvim'
"Plug 'arcticicestudio/nord-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"Random cosmetic stuff
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'lukas-reineke/indent-blankline.nvim'

"Adds the gitgutter on the left.
Plug 'airblade/vim-gitgutter'

"File Managerment
Plug 'junegunn/fzf.vim'

"Status Line
"Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'

"LSP / Autocompetion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

"Writeing stuff
Plug 'junegunn/goyo.vim'
Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/vim-grammarous'
Plug 'junegunn/limelight.vim'
Plug 'AdamTillou/vim-imager'

"Perlang stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

"Session Saveing 
Plug 'tpope/vim-obsession'

"File Mangagement
Plug 'vifm/vifm.vim'

call plug#end() 

"Goyo
let g:goyo_width = 120
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Turns on line numbers
set number

" Vifm
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = "Vifm"
nnoremap <silent> <Leader>f :Vifm<CR>

"Markdown Stuffs
let g:vim_markdown_folding_disabled = 1
set conceallevel=2
set textwidth=120 " Sets the text with when using gq

"Vim Wiki
let g:vimwiki_list = [{'path': '~/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_markdown_link_ext = 1

"Theme
colorscheme catppuccin
"highlight Normal ctermbg=NONE
luafile $HOME/.config/nvim/colorizer.lua
lua << EOF
local catppuccin = require("catppuccin")
catppuccin.setup({
	styles = {
		strings = "italic",
	}
})
EOF


if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


"Tab Length
set ts=4 sw=4

"Multi Line Tab
:vmap <Tab> >
:vmap <S-Tab> <

"Spits 
"set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-Right> :vert res +3<CR>
nnoremap <silent> <C-Left> :vert res -3<CR>
nnoremap <silent> <C-Up> :res +3<CR>
nnoremap <silent> <C-Down> :res -3<CR>

"Vim-go
let g:go_def_mapping_enabled = 0

"Status line
lua require('lualine').setup()

"Key Mappings 
let mapleader = " "
nnoremap <C-f> :GFiles <CR>

"Spell Check
set spelllang=en
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.org set filetype=org
autocmd BufRead,BufNewFile *.groff set filetype=groff
autocmd BufRead,BufNewFile *.roff set filetype=roff
autocmd BufRead,BufNewFile *.txt set filetype=text
"Spellcheck for md and txt files
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell
autocmd FileType org setlocal spell
autocmd FileType groff setlocal spell
autocmd FileType roff setlocal spell

" LSP config (the mappings used in the default file don't quite work right)
luafile ~/.config/nvim/compe-config.lua
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" LSP-autoformat
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.bash lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.zsh lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" LSP-Servers
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.pyright.setup{}
