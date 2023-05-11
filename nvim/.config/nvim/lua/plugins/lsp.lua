return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Null-ls
      {'jose-elias-alvarez/null-ls.nvim'},
      {'jay-babu/mason-null-ls.nvim'},
    },

    config = function ()
      -- Lsp
      local lsp = require('lsp-zero').preset({
        manage_nvim_cmp = {
          set_sources = 'lsp',
          set_basic_mappings = true,
          set_extra_mappings = false,
          use_luasnip = true,
          set_format = true,
          documentation_window = true,
        }
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- Autointall
      lsp.ensure_installed({
        'lua_ls',
        'gopls',
        'rust_analyzer',
        'pyright',
        'ltex',
        'clangd',
        'bashls',
        'jsonls',
        'vimls',
        -- 'tsserver',
        -- 'rome',
        'rnix',
      })



      -- Server Settings
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			require('lspconfig').ltex.setup({
        on_attach = function(client, bufnr)
            -- your other on_attach functions.
            require("ltex_extra").setup{
                load_langs = { "es-AR", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
                init_check = true, -- boolean : whether to load dictionaries on startup
                path = nil, -- string : path to store dictionaries. Relative path uses current working directory
                log_level = "none", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
            }
        end,
        settings = {
          ltex = {
            language = "en",
            disabledRules = { ['en'] = { 'PROFANITY' } },
          },
        },
      })

      lsp.setup()

       -- Autocompletion
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          ['<Return>'] = cmp.mapping.confirm({ select = true }),
        }
      })
    -- Null-Ls
      local null_ls = require('null-ls')

      null_ls.setup({
        on_attach = function(client, bufnr)
          local format_cmd = function(input)
            vim.lsp.buf.format({
              id = client.id,
              timeout_ms = 5000,
              async = input.bang,
            })
          end

          local bufcmd = vim.api.nvim_buf_create_user_command
          bufcmd(bufnr, 'NullFormat', format_cmd, {
            bang = true,
            range = true,
            desc = 'Format using null-ls'
          })

          vim.keymap.set('n', 'gq', '<cmd>NullFormat!<cr>', {buffer = bufnr})
        end,
        sources = {
          --- Replace these with the tools you have installed
          -- null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.formatting.prettier,
        }
      })

      require('mason-null-ls').setup({
        ensure_installed = {
          'gofumpt',
          'goimports-reviser',
          'jq',
          'rustfmt',
          'stylua',
          'black', -- Python
          'shfmt',
          'clang-format',
        },
        automatic_installation = true,
        automatic_setup = true,
      })
      require('mason-null-ls').setup_handlers()

    end
  }
}
