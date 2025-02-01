return
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    gitbrowse = { enabled = true },
    dashboard = require("dashboard"),
    indent = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },

    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
  },

  keys = {
    {"<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame line"},
    {"<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit"},
    {"<leader>n", function() Snacks.notifier.show_history() end, desc = "Show Notifications"},
  }
}
