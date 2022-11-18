local present, db = pcall(require, "dashboard")
if not present then return end

local home = os.getenv('HOME')
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70
db.session_directory = home .. '/sync/nvim_sessions'
db.session_auto_save_on_exit = true
db.session_verbose = false
db.custom_center = {
    {icon = '  ',
    desc = 'Session                                 ',
    shortcut = 'SPC s l',
    action ='SessionLoad'},
    {icon = '+   ',
    desc = 'New file                               ',
    shortcut = 'SPC f n',
    action ='SessionLoad'},
    {icon = '  ',
    desc ='File Browser                            ',
    action =  'Vifm',
    shortcut = 'SPC f b'},
    {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'edit new',
    shortcut = 'SPC f h'},
    {icon = '    ',
    desc = 'Vim Be Good                             ',
    action =  'VimBeGood',
    shortcut = 'SPC v'},
  }
db.custom_header = {
    '',
    '      ___           ___           ___                                     ___     ',
    '     /\\  \\         /\\__\\         /\\  \\          ___                      /\\  \\    ',
    '     \\:\\  \\       /:/ _/_       /::\\  \\        /\\  \\        ___         |::\\  \\   ',
    '      \\:\\  \\     /:/ /\\__\\     /:/\\:\\  \\       \\:\\  \\      /\\__\\        |:|:\\  \\  ',
    '  _____\\:\\  \\   /:/ /:/ _/_   /:/  \\:\\  \\       \\:\\  \\    /:/__/      __|:|\\:\\  \\ ',
    ' /::::::::\\__\\ /:/_/:/ /\\__\\ /:/__/ \\:\\__\\  ___  \\:\\__\\  /::\\  \\     /::::|_\\:\\__\\',
    ' \\:\\~~\\~~\\/__/ \\:\\/:/ /:/  / \\:\\  \\ /:/  / /\\  \\ |:|  |  \\/\\:\\  \\__  \\:\\~~\\  \\/__/',
    '  \\:\\  \\        \\::/_/:/  /   \\:\\  /:/  /  \\:\\  \\|:|  |   ~~\\:\\/\\__\\  \\:\\  \\      ',
    '   \\:\\  \\        \\:\\/:/  /     \\:\\/:/  /    \\:\\__|:|__|      \\::/  /   \\:\\  \\     ',
    '    \\:\\__\\        \\::/  /       \\::/  /      \\::::/__/       /:/  /     \\:\\__\\    ',
    '     \\/__/         \\/__/         \\/__/        ~~~~           \\/__/       \\/__/    ',
    '',
}
