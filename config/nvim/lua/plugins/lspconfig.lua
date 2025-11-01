-- lspconf.lua
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({ensure_installed = { 
          "lua_ls",
          "bashls",
          "cssls",
          "powershell_es",
          "html",},
      })
    end,
  },
{
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Auto-setup all installed servers
      local servers = {
        "lua_ls",
        "bashls",
        "cssls",
        "powershell_es",
        "html",
      }

      for _, server in ipairs(servers) do
      vim.lsp.enable(server)      
      end
    end,
  },
}
