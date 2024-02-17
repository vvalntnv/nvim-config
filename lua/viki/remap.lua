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
vim.keymap.set('n', "<leader>nh", ":noh<CR>")


-- LSP Server --
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')


-- Harpoon --

vim.keymap.set('n', "<C-a>", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', "<C-l>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', "<C-e>", ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', "<C-q>", ':lua require("harpoon.ui").nav_prev()<CR>')


-- nvim-dap --
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<C-F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)


-- nvim-dap-ui --
vim.keymap.set("n", "<leader>od", function() require("dapui").open() end)
vim.keymap.set("n", "<leader>cd", function() require("dapui").close() end)
