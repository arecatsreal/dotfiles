return {
  {
    'glepnir/lspsaga.nvim',

    config = function ()
            require('lspsaga').setup({ symbol_in_winbar = { enable = false } })

      -- function NoWinbar()
      --   local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
      --   local blocklist = {
      --     'markdown',
      --     'org,',
      --     'vimwiki',
      --   }
      --   for i = 1, #blocklist, 1 do
      --     if filetype == blocklist[i] then
      --     end
      --   end
      -- end
      -- vim.cmd("au CursorMoved * lua NoWinbar()")
    end
  }
}
