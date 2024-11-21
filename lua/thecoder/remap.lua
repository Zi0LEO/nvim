vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', "<leader>w", "mzgg=G`z<cmd>w<CR>")
vim.keymap.set("n","<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gl<Left><Left><Left>")
