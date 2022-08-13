local map = vim.keymap.set
map('n', '<F1>', ':Windows<CR>', {noremap = true})
map('n', '<F2>', ':GFiles<CR>', {noremap = true})
map('n', '?', '/', {noremap = true})
map('n', '/', ':Lines<CR>')
