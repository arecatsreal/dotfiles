return {
	'folke/trouble.nvim',
  cmd = 'Trouble',

	config = function ()
		require('trouble').setup {
		  height = 5,
		  action_keys = {
		    previous = "e",
		    next = "n",
		  },
		  auto_open = false,
		  auto_close = true,
		}
	end
}
