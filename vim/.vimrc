set nocompatible
"Plugin manger
call plug#begin('~/.vimplugins')
"Automatic parentheses.
Plug 'jiangmiao/auto-pairs'
"Better syntax highlight for a ton of langs.
Plug 'sheerun/vim-polyglot'
"Theme
Plug 'dracula/vim', { 'as': 'dracula' }
"Adds the gitgutter on the right.
Plug 'airblade/vim-gitgutter'
"Autocomplete
Plug 'vim-scripts/AutoComplPop'
"Crappy implementation of org-mod.
Plug 'jceb/vim-orgmode'
"Fuzzy Find
Plug 'junegunn/fzf.vim'
"Status Line
Plug 'itchyny/lightline.vim'
call plug#end() 

"Turns on line numbers
set number

"Markdown Stuffs
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

"Theme
colorscheme dracula
highlight Normal ctermbg=black

"Status line
set laststatus=2
let g:lightline = {'colorscheme': 'dracula',}

"Key Mappings 
nnoremap <C-f> :GFiles <CR>
