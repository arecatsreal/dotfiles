return {
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
		},

		config = function ()
			require('bufferline').setup({
				icon_close_tab = '',
				icon_close_tab_modified = '+',
				minimum_padding = 0,
				maximum_padding = 2,
				auto_hide = true,
			})
		end
	},
}
