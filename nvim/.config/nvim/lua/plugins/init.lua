return {
  'lewis6991/impatient.nvim',
	-- Nvim in the browser
	-- { 'glacambre/firenvim', build = function() vim.fn['firenvim#install'](0) end },

	-- Automatic surrounds with better control.
	'jiangmiao/auto-pairs',
	'tpope/vim-surround',

	-- Theme
  {
    'Mofiqul/dracula.nvim',
    lazy = true,
  },

	-- Database Viwer
	{
		'tpope/vim-dadbod',
		cmd = "DB"
	},

	-- Random cosmetic stuff
	'ryanoasis/vim-devicons',

	-- LSP / Autocompetion / Sips
	'folke/trouble.nvim',

	-- REST api
	{
		'rest-nvim/rest.nvim',
		ft = "http",
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

	-- File Mangagement
	{
		'vifm/vifm.vim',
		Keys = { "<Leader>f", ":Vifm<CR>", mode="n" },
		cmd = "Vifm"
	},
	{
		'jremmen/vim-ripgrep',
		keys = {
			{ "<F4>", ":Rg", mode = "n"  }
		},
		cmd = "Rg"
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	-- Mic
	{
		'ThePrimeagen/vim-be-good',
		cmd = "VimBeGood",
    lazy=true
	},
  {
    'barreiroleo/ltex-extra.nvim',
    lazy = true
  },
}
