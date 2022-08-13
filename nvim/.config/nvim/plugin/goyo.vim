let g:goyo_width = 120

" Enter Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoEnter lua require('lualine').hide({place = {'statusline', 'tabline', 'winbar'}, unhide = false,})

" Exit Goyo
autocmd! User GoyoLeave Limelight!
autocmd! User GoyoLeave lua require('lualine').hide({place = {'statusline', 'tabline', 'winbar'}, unhide = true,})
