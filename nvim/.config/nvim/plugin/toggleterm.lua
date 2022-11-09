local map = vim.keymap.set

map('n', '<leader>tt', ':ToggleTerm dir=. direction=float<CR>')
map('n', '<leader>tn', ':ToggleTerm dir=. direction=horizontal size=20<CR>')
map('n', '<leader>th', ':ToggleTerm dir=. direction=vertical size=80<CR>')
