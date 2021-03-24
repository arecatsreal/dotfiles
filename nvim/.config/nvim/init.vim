"Plugin manger
call plug#begin('~/.vimplugins')
"Automatic parentheses.
Plug 'jiangmiao/auto-pairs'

"Syntax highlight
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"Theme
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'

"Adds the gitgutter on the right.
Plug 'airblade/vim-gitgutter'

"Fuzzy Find
Plug 'junegunn/fzf.vim'

"Status Line
Plug 'itchyny/lightline.vim'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

"Writeing stuff
Plug 'junegunn/goyo.vim'
Plug 'jceb/vim-orgmode'

"Perlang stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end() 

"Turns on line numbers
set number

"Markdown Stuffs
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

"Theme
colorscheme nord
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
"let g:lightline = {'colorscheme': 'nord',}
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
let g:lightline = {'colorscheme': 'nord'}

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
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)

" LSP-Servers
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.gopls.setup{}
