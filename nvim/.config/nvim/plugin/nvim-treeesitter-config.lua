require'nvim-treesitter.configs'.setup {
	auto_install = true,
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
	ensure_installed = { "http", "json", "go", "bash", "cpp" }
}
