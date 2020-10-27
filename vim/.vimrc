set nocompatible
"Pluging manger
call plug#begin('~/.vimplugins')
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/AutoComplPop'
Plug 'jceb/vim-orgmode'
call plug#end() 

"Theme
colorscheme dracula
highlight Normal ctermbg=black

"Turns on line numbers
set number

"Markdown Stuffs
let g:vim_markdown_folding_disabled = 1
set conceallevel=2
