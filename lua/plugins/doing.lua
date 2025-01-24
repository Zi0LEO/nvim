-- minimal installations
return {
  dir='~/projects/doing.nvim',
  config = function ()
    require("doing").setup {
      doing_prefix = "",
      winbar = { enabled = false }
    }
    local doing = require("doing")
    vim.keymap.set("n", "<leader>da", doing.add, { desc = "[D]oing: [A]dd" })
    vim.keymap.set("n", "<leader>de", doing.edit, { desc = "[D]oing: [E]dit" })
    vim.keymap.set("n", "<leader>dn", doing.done, { desc = "[D]oing: Do[n]e" })
    vim.keymap.set("n", "<leader>dt", doing.toggle, { desc = "[D]oing: [T]oggle" })
    vim.keymap.set("n", "<leader>ds", function()
      vim.notify(doing.status(true), vim.log.levels.INFO,
      { title = "Doing:", icon = "", })
    end, { desc = "[D]oing: [S]tatus", })
  end
}
