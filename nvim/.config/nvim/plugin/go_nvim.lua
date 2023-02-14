local present, go_nvim = pcall(require, "go")
if not present then return end
-- require("go.format").goimport() -- goimport + gofmt
go_nvim.setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
