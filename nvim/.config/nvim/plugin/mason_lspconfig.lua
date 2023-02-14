local present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present then return end

mason_lspconfig.setup()

local DEFAULT_SETTINGS = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {"sumneko_lua", "gopls", "bash-language-server"},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  bashls = {},
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = true },
      telemetry = { enable = false },
    },
  },
}
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
