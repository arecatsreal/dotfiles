local present, trouble = pcall(require, "trouble")
if not present then return end

trouble.setup {
  height = 5,
  action_keys = {
    previous = "e",
    next = "n",
  },
  auto_open = true,
  auto_close = true,
}
