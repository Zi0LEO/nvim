local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc="add file to harpoon"})
vim.keymap.set("n", "<C-l>", ui.toggle_quick_menu, { desc="open harpoon ui"})

vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end, {desc="move to file 1 in harpoon"})
vim.keymap.set("n", "<C-e>", function() ui.nav_file(2) end, {desc="move to file 2 in harpoon"})
vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end, {desc="move to file 3 in harpoon"})
vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end, {desc="move to file 4 in harpoon"})
