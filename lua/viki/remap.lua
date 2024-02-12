vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

vim.keymap.set('n', "<leader>bf", ":!black %<CR>")

vim.keymap.set('n', "<leader>me", ":set mouse=a<CR>")
vim.keymap.set('n', "<leader>md", ":set mouse=<CR>")

-- Harpoon --

vim.keymap.set('n', "<C-a>", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', "<C-l>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', "<C-e>", ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', "<C-q>", ':lua require("harpoon.ui").nav_prev()<CR>')
