require('packer').startup(function(use)

		-- Nvim in the browser
		  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

		-- Automatic surrounds with better control.
		use 'jiangmiao/auto-pairs'
		use 'tpope/vim-surround'

		-- Syntax highlight
		use 'sheerun/vim-polyglot'
		use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

		-- Perlang stuff
		-- use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
		use 'ray-x/go.nvim'
		use { -- Rust
			'simrat39/rust-tools.nvim',
			requires = {{'neovim/nvim-lspconfig'}}
		}
		-- Fennel
		use 'jaawerth/fennel.vim'
		use {
			'Olical/aniseed',
			requires = {{'Olical/conjure'}}
		}
		-- Theme
		-- use 'Mofiqul/dracula.nvim'
		-- use 'arcticicestudio/nord-vim'
		use {'catppuccin/nvim', as = 'catppuccin'}
		use 'EdenEast/nightfox.nvim'

		-- Random cosmetic stuff
		use 'ryanoasis/vim-devicons'
		use 'norcalli/nvim-colorizer.lua'
		use 'junegunn/rainbow_parentheses.vim'
		use 'lukas-reineke/indent-blankline.nvim'
		use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

		-- Gitgutter
		use 'airblade/vim-gitgutter'

		-- Status Line
		-- use 'itchyny/lightline.vim'
		use 'nvim-lualine/lualine.nvim'

		-- LSP / Autocompetion / Sips
		use {
			'hrsh7th/nvim-cmp',
			requires = {
				{'neovim/nvim-lspconfig'},
				{'hrsh7th/cmp-nvim-lsp'},
				{'hrsh7th/cmp-buffer'},
				{'hrsh7th/cmp-path'},
				{'hrsh7th/cmp-cmdline'}
		}
		}
		use 'folke/trouble.nvim'
		use {
			'saadparwaiz1/cmp_luasnip',
			requires = {
				{'hrsh7th/nvim-cmp'},
				{'L3MON4D3/LuaSnip'},
				{'rafamadriz/friendly-snippets'}
		}
	}

		-- Writeing stuff
		use 'Pocco81/true-zen.nvim'
		use 'folke/twilight.nvim'
		use 'jceb/vim-orgmode'
		use 'dhruvasagar/vim-table-mode'
		use 'vimwiki/vimwiki'
		use 'rhysd/vim-grammarous'
		use 'h-hg/fcitx.nvim'

		-- File Mangagement
		use 'vifm/vifm.vim'
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				{'kyazdani42/nvim-web-devicons' },
				{'neanias/telescope-lines.nvim'},
			}
		}
		use 'jremmen/vim-ripgrep'
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.x',
			requires = { {'nvim-lua/plenary.nvim'} }
		}

		-- Rebinds stuff for colemak
		use 'beardedfoo/vim-colemak'

		-- Mic
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
	use 'numToStr/Comment.nvim'
	use {
	'ggandor/leap.nvim',
	function ()
		require('leap').add_default_mappings()
	end
	}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)
