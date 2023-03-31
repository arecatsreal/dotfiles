"--- Auto commands ---
autocmd FileType zsh set filetype=sh "-- Changes all files with file type "zsh" to "bash".
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "-- Disable auto commenting on newline.

"-- Better detect file types from exertions.
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.org set filetype=org
autocmd BufRead,BufNewFile *.groff set filetype=groff
autocmd BufRead,BufNewFile *.roff set filetype=roff
autocmd BufRead,BufNewFile *.txt set filetype=text

"-- Auto turn on spell check.
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell
autocmd FileType org setlocal spell
autocmd FileType groff setlocal spell
autocmd FileType roff setlocal spell
autocmd FileType mail setlocal spell
