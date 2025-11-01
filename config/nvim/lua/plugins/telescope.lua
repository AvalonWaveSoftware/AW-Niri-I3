  --telescope
return { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
dependencies = { 'nvim-lua/plenary.nvim' },
--telescope keybinds
config = function()
  local builtin = require("telescope.builtin")
  vim.keymap.set('n', '<C-f>', builtin.find_files, {})
  vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
end
}
