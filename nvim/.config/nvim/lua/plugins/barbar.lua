return {
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
		},

		config = function ()
			require('bufferline').setup({
        icons = {
          modified = {button = '+'},
          button = {button = ''}
        },
				minimum_padding = 0,
				maximum_padding = 2,
				auto_hide = true,
			})
		end
	},
}
