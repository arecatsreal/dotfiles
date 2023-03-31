local map = vim.keymap.set

--- Mappings ---
vim.g.mapleader = " " -- Maps leader key.
map('n', '<Leader>f', ':Vifm<CR>') -- Opens Vifm.
map('n', 'C-t', ':TableModeToggle<CR>', {noremap = true})
-- map('n', 'zz', ':bdelete<CR>')
map('n', '<Leader>rn', ':Lspsaga rename<CR>')
map('n', '<Leader>d', ':Lspsaga hover_doc<CR>')
map('n', '<Leader>ca', ':Lspsaga code_action<CR>')
map('n', '<Leader>lf', ':Lspsaga lsp_finder<CR>')
map('n', '<Leader>s', ':Lspsaga outline<CR>')

-- Zen Mod
map('n', '<Leader>zz', ':TZAtaraxis<CR>') -- Open Propper zen mode.
map('v', '<Leader>zn', ":'<,'>TZNarrow") -- Narrow View of buffer.
map('n', '<Leader>zf', ':TZFocus<CR>') -- Foccus Pane.

-- BarBar
map('n', 'N', ':BufferNext<CR>')
map('n', 'E', ':BufferPrevious<CR>')
map('n', 'Q', ':BufferDelete<CR>')
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')

-- Grammar Linter
map('n', '<Leader>g', ':GrammarousCheck<CR>') -- Lints current buffer with LanguageTool.
map('v', '<Leader>g', ":'<,'>GrammarousCheck<CR>") -- Lints current selection with LanguageTool.

-- Terminal
-- map('t', '<ESC>', '<C-\\><C-n>') -- Exit term with <ESC>.
map('n', '<Leader>tt', ':ToggleTerm dir=. direction=float<CR>')
map('n', '<Leader>tn', ':ToggleTerm dir=. direction=horizontal size=20<CR>')
map('n', '<Leader>th', ':ToggleTerm dir=. direction=vertical size=80<CR>')

-- REST
map('n', '<Leader>rr', '<Plug>RestNvim')
map('n', '<Leader>rp', '<Plug>RestNvimPreview')
map('n', '<Leader>rl', '<Plug>RestNvimLast')

-- Source Current file
map('n', '<F5>', function ()
	vim.cmd(":w")
	vim.cmd(":source %")
end, { noremap = true })

-- Tree
-- map('n', '<F3>', ':Neotree<CR>')

-- Fuzzyfinding
map('n', '<F1>', ':Telescope buffers<CR>', {noremap = true})
map('n', '<F2>', ':Telescope git_files<CR>', {noremap = true})
map('n', 'z=', ':Telescope spell_suggest<CR>'); map('n', '?', '/', {noremap = true})
map('n', '/', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', 'T', ':Telescope treesitter<CR>')
map('n', 'P', ":Telescope neoclip<CR>")

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
