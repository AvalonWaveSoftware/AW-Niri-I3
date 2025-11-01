-- Neo-tree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = { ".git" },
        never_show = {},
      },
    },
  },
  config = function()
    vim.keymap.set('n', 'T', ':Neotree toggle filesystem reveal left<CR>')

    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        vim.cmd("Neotree filesystem reveal left dir=" .. vim.fn.getcwd())
      end,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 then
          local win = vim.api.nvim_get_current_win()
          if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "filetype") == "neo-tree" then
            vim.cmd("quit")
          end
        end
      end,
    })
  end,
}
