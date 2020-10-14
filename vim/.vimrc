
"Pluging manger
call plug#begin('~/.vimplugins')
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
call plug#end()

"Turns on line numbers
set number

"rust stuff
let g:polyglot_disabled = ['rust']

"Maps key for sidebar file browser (NERDTree)
map <C-b> :NERDTreeToggle<CR>

"Markdown Stuffs
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

"External copy paste
vnoremap <C-c> "+y
map <C-v> "+P

" stylish-haskell
autocmd BufWrite *.hs :Autoformat
" Don't automatically indent on save, since vim's autoindent for haskell is buggy
autocmd FileType haskell let b:autoformat_autoindent=0
