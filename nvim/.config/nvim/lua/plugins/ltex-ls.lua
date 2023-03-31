return {
  {
    'vigoux/ltex-ls.nvim',
    dependencies = {
      'neovim/nvim-lspconfig'
    },
    -- ft = {
    --   'bib',
    --   'gitcommit',
    --   'markdown',
    --   'org',
    --   'plaintex',
    --   'rst',
    --   'rnoweb',
    --   'tex',
    --   'pandoc'
    -- },
    enabled = false,

    config = function ()
      require('ltex-ls').setup {
        use_spellfile = true, -- Uses the value of 'spellfile' as an external file when checking the document
        window_border = 'single', -- How the border should be rendered
        -- Put your lsp config here, just like with nvim-lspconfig
      }
    end
  },
}
