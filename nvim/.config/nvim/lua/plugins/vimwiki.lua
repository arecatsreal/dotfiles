return{
  {
    'vimwiki/vimwiki',
    dependencies = {
      'jceb/vim-orgmode',
      'dhruvasagar/vim-table-mode',
      'rhysd/vim-grammarous',
      'h-hg/fcitx.nvim',
    },
    ft = {
      "markdown",
      "org",
      "vimwiki",
      "vimwiki_markdown_custom",
      "markdown_tablemode"
    },
    -- enabled = false,

    config = function ()
      vim.cmd("let g:vimwiki_list = [{'path': '~/Notes/', 'syntax': 'markdown', 'ext': '.md'}]")
      vim.cmd("autocmd FileType vimwiki setlocal filetype=markdown")
    end
  },
}
