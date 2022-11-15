local present, barbar = pcall(require, "bufferline")
if not present then return end

barbar.setup({
  icon_close_tab = '',
  icon_close_tab_modified = '+',
  minimum_padding = 0,
  maximum_padding = 2,
  auto_hide = true,
})
