return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

  config = function()
    require("go").setup()
    require("mason").setup()
    require("mason-lspconfig").setup()
    local install_root_dir = ".local/share/nvim/mason/packages/gopls"
    require('lspconfig').gopls.setup({
      gopls_cmd = {install_root_dir .. '/go/gopls'},
      fillstruct = 'gopls',
      dap_debug = true,
      dap_debug_gui = true
    })

    -- Run gofmt + goimport on save
    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })

    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.diagnostics.revive,
      null_ls.builtins.formatting.golines.with({
        extra_args = {
          "--max-len=180",
          "--base-formatter=gofumpt",
        },
      })
    }
    -- for go.nvim
    local gotest = require("go.null_ls").gotest()
    local gotest_codeaction = require("go.null_ls").gotest_action()
    local golangci_lint = require("go.null_ls").golangci_lint()
    table.insert(sources, gotest)
    table.insert(sources, golangci_lint)
    table.insert(sources, gotest_codeaction)
    null_ls.setup({ sources = sources, debounce = 1000, default_timeout = 5000 })
  end,
}
