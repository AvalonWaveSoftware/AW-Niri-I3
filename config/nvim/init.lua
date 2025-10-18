vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--add the lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--Plugins installed by lazy
local plugins = {
  --colorscheme
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  --telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }},
  --hints system for programing
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
--treesitter options
local opts = {}

--Run lazy package manager
require("lazy").setup(plugins, opts)

--telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

--run treesitter:
local configs = require("nvim-treesitter.configs")
configs.setup({
                ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "bash", "query", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
              })

--color scheme baby
vim.cmd.colorscheme "moonfly"

