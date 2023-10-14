return {
	{
		"echasnovski/mini.nvim",
		version = "*",

		config = function()
			-- require("mini.animate").setup()
			require("mini.cursorword").setup()
			_G.cursorword_blocklist = function()
				local filetype = vim.api.nvim_buf_get_option(0, "filetype")
				local blocklist = {
					"markdown",
					"org",
					"vimwiki",
					"vimwiki_markdown_custom",
					"markdown_tablemode",
					"text",
					"txt",
					"man",
					"help",
					"",
				}
				for i = 1, #blocklist, 1 do
					if filetype == blocklist[i] then
						vim.b.minicursorword_disable = true
					end
				end
			end
			-- Make sure to add this autocommand *before* calling module's `setup()`.
			vim.cmd("au FileType * lua _G.cursorword_blocklist()")

			require("mini.trailspace").setup()
			function RmTrailingSpace()
				local filetype = vim.api.nvim_buf_get_option(0, "filetype")
				local rmSpace = true
				local blocklist = {
					"neo-tree",
					"help",
					"man",
				}
				for i = 1, #blocklist, 1 do
					if filetype == blocklist[i] then
						rmSpace = false
					end
				end
				if rmSpace then
					MiniTrailspace.trim()
				end
			end
			vim.cmd("au InsertLeave * lua RmTrailingSpace()")
		end,
	},
}
