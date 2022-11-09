local map = vim.keymap.set

--- Mappings ---
vim.g.mapleader = " " -- Maps leader key.
map('n', '<Leader>f', ':Vifm<CR>') -- Opens Vifm.
map('n', 'C-t', ':TableModeToggle<CR>', {noremap = true})
-- map('n', 'zz', ':bdelete<CR>')

-- Zen Mod
map('n', '<Leader>zz', ':TZAtaraxis<CR>') -- Open Propper zen mode.
map('v', '<Leader>zn', ":'<,'>TZNarrow") -- Narrow View of buffer.
map('n', '<Leader>zf', ':TZFocus<CR>') -- Foccus Pane.

-- Bufferline
map('n', 'N', ':BufferLineCycleNext<CR>')
map('n', 'E', ':BufferLineCyclePrev<CR>')

-- Grammar Linter
map('n', '<Leader>g', ':GrammarousCheck<CR>') -- Lints current buffer with LanguageTool.
map('v', '<Leader>g', ":'<,'>GrammarousCheck<CR>") -- Lints current selection with LanguageTool.

-- Terminal
map('t', '<ESC>', '<C-\\><C-n>') -- Exit term with <ESC>.
map('n', '<Leader>tt', ':ToggleTerm dir=. direction=float<CR>')
map('n', '<Leader>tn', ':ToggleTerm dir=. direction=horizontal size=20<CR>')
map('n', '<Leader>th', ':ToggleTerm dir=. direction=vertical size=80<CR>')

-- Source Current file
map('n', '<F5>', ':source %<CR>', {noremap = true})

-- Fuzzyfinding
map('n', '<F1>', ':Telescope buffers<CR>', {noremap = true})
map('n', '<F2>', ':Telescope git_files<CR>', {noremap = true})
map('n', 'z=', ':Telescope spell_suggest<CR>'); map('n', '?', '/', {noremap = true})
map('n', '/', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', 'T', ':Telescope treesitter<CR>')

-- Multi line tabbing
map('v', '<Tab>', '>')
map('v', 'S-<Tab>', '<')

-- Yank and Put from system primary clipboard.
map('v', 'y', '"+y')
map('v', 'p', '"+p')
map('n', 'y', '"+y')
map('n', 'p', '"+p')
map('v', 'd', '"+d')
map('n', 'dd', '"+dd')
map('n', 'D', '"+D')

-- Keyboard shortcuts for multi line commands.
map('v', 'M', ':norm M', {noremap = true}) -- Change M to I for vim without colemak bindings.
map('v', 'A', ':norm A', {noremap = true})
map('v', 'R', ':s/', {noremap = true}) -- Regex
