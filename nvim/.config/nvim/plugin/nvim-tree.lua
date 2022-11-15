local present, nvimtree = pcall(require, "nvim-tree")
if not present then return end
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
--require("nvim-tree").setup()

vim.keymap.set('n', '<F3>', ':NvimTreeToggle <CR>')
vim.keymap.set('n', '`', ':NvimTreeFocus <CR>')
vim.keymap.set('n', 'C-<F3>', ':NvimTreeFindFileToggle <CR>')

-- OR setup with some options
nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
