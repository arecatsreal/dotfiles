"Plugin manger
call plug#begin('~/.vimplugins')
"Nvim in teh browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Automatic parentheses.
Plug 'jiangmiao/auto-pairs'

"Syntax highlight
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"Theme
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'arcticicestudio/nord-vim'

"Random cosmetic stuff
Plug 'ryanoasis/vim-devicons'

"Adds the gitgutter on the right.
Plug 'airblade/vim-gitgutter'

"File Managerment
Plug 'junegunn/fzf.vim'

"Status Line
Plug 'itchyny/lightline.vim'

"LSP / Autocompetion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

"Writeing stuff
Plug 'junegunn/goyo.vim'
Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'reedes/vim-pencil'

"Perlang stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end() 

"Goyo
let g:goyo_width = 100

"Turns on line numbers
set number

"Markdown Stuffs
let g:vim_markdown_folding_disabled = 1
set conceallevel=2
set tw=100 " Sets the text with when using gq
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init()
	autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

"Theme
colorscheme dracula
highlight Normal ctermbg=NONE

"Tab Length
set ts=4 sw=4

"Multi Line Tab
:vmap <Tab> >
:vmap <S-Tab> <

"Vim-go
let g:go_def_mapping_enabled = 0

"Status line
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"Key Mappings 
let mapleader = " "
nnoremap <C-f> :GFiles <CR>

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
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)

" LSP-Servers
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.pyright.setup{}
