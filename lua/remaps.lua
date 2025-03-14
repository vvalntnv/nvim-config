local snacks = require("snacks")

vim.keymap.set('n', '<C-s>', [[:w<CR>]], { desc = 'Save file' })
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

-- Lazy --
vim.keymap.set('n', '<leader>z', [[:Lazy<CR>]], { desc = "Open Lazy" })
vim.keymap.set('n', '<leader>nh', snacks.notifier.show_history)

-- Nvim Tree -- 
vim.keymap.set('n', '<leader>e', [[:NvimTreeToggle<CR>]], { desc = 'Open netrw file explorer' })
vim.keymap.set('n', '<C-h>', [[:NvimTreeFocus<CR>]], { desc = 'Focus on the nvim tree' })
vim.keymap.set('n', '<leader>tr', [[:NvimTreeRefresh<CR>]], { desc = 'Focus on the nvim tree' })


-- Code Actions --
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')


-- Signature
vim.keymap.set({ 'n' }, '<C-Space>', function()
	require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })

