return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,

    config = function ()
      require("catppuccin").setup({
          flavour = "mocha", -- latte, frappe, macchiato, mocha
          background = { -- :h background
              light = "latte",
              dark = "mocha",
          },
          transparent_background = false,
          show_end_of_buffer = false, -- show the '~' characters after the end of buffers
          term_colors = false,
          dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
          },
          no_italic = false, -- Force no italic
          no_bold = false, -- Force no bold
          styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
          },
          color_overrides = {},
          custom_highlights = {},
          integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              telescope = true,
              mini = true,
              mason = true,
              leap = true,
              vimwiki = true,
              barbar = true,
              indent_blankline = {
                  enabled = true,
                  colored_indent_levels = false,
              },
              native_lsp = {
                  enabled = true,
                  virtual_text = {
                      errors = { "italic" },
                      hints = { "italic" },
                      warnings = { "italic" },
                      information = { "italic" },
                  },
                  underlines = {
                      errors = { "underline" },
                      hints = { "underline" },
                      warnings = { "underline" },
                      information = { "underline" },
                  },
              },
              -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          },
      })

      -- Lspsaga intigration
      require("lspsaga").setup {
          ui = {
              kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
          },
      }
    end
  }
}