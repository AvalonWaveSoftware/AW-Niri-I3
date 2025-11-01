vim.opt.number = true

-- 2. Toggle with Shift+N (Normal mode only)
vim.keymap.set("n", "N", function()
  vim.cmd("set invnumber")   -- toggle :set number
end, {
  desc = "Toggle line numbers",
  noremap = true,
  silent = true,
})
