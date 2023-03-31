return {
	'lukas-reineke/indent-blankline.nvim',
  config = function ()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#293e40 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineContextChar guifg=#8eb2af gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineContextStart guifg=#8eb2af gui=nocombine]]

    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"

    require("indent_blankline").setup{
      space_char_blankline = " ",
      show_current_context = true,
      use_treesitter = true,
      show_trailing_blankline_indent = true ,
      char_highlight_list = {
        "IndentBlanklineIndent1",
      },
      indent_blankline_filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "",
        "markdown",
        "org",
        "vimwiki",
      }
    }
    -- Disable per FileType.
    vim.cmd("autocmd FileType markdown IndentBlanklineDisable")
    vim.cmd("autocmd FileType markdown lua vim.opt.list = false")
    vim.cmd("autocmd FileType org IndentBlanklineDisable")
    vim.cmd("autocmd FileType org lua vim.opt.list = false")
  end,
}
