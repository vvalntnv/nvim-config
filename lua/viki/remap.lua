vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

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
vim.keymap.set('n', "del", "v$<bs>d")

vim.keymap.set('n', "<leader>rw", "viws")
vim.keymap.set('n', "<leader>dw", "viwd")


-- LSP Server --
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')


-- Harpoon --
vim.keymap.set('n', "<leader>a", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', "<leader>ll", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', "<leader>w]", ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', "<leader>w[", ':lua require("harpoon.ui").nav_prev()<CR>')


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


-- Copilot --
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')


-- Rust Tools --
vim.keymap.set('n', '<leader>h', ':require("rust-tools").inlay_hints.set()<CR>')
vim.keymap.set('n', '<leader>hh', 'require("rust-tools").inlay_hints.unset()<CR>')

-- Fugitive --
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>");
vim.keymap.set("n", "<leader>gp", ":Git push<CR>");


-- TODO comments --

vim.keymap.set("n", "<leader>todo", ":TodoTelescope<CR>")
