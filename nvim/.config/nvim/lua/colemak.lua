local map = vim.keymap.set

map('n', 'u', 'i', {noremap = true})
map('n', 'l', 'u', {noremap = true})
-- right hand nav
map('n', 'n', 'j', {noremap = true})
map('v', 'n', 'j', {noremap = true})
map('n', 'e', 'k', {noremap = true})
map('v', 'e', 'k', {noremap = true})
map('n', 'i', 'l', {noremap = true})
map('v', 'i', 'l', {noremap = true})
map('n', 'k', 'n', {noremap = true})
map('n', 'K', 'N', {noremap = true})

-- m goes to insert mode, or with shift at beginning of line
map('n', 'm', 'i', {noremap = true})
map('n', 'M', 'I', {noremap = true})

-- shift+i does nothing
map('n', 'I', '<nop>', {noremap = true})
