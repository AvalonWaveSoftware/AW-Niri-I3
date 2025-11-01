--hints system for programing
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
    config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "bash", "query", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
