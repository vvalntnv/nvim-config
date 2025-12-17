local snacks = require("snacks")

vim.keymap.set("n", "<C-s>", [[:w<CR>]], { desc = "Save file" })
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Lazy --
vim.keymap.set("n", "<leader>z", [[:Lazy<CR>]], { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>nh", snacks.notifier.show_history)

-- Neotree --
vim.keymap.set("n", "<leader>e", [[:Neotree action=focus source=filesystem reveal<CR>]])
vim.keymap.set("n", "<C-x>", [[:Neotree action=show toggle reveal<CR>]])
vim.keymap.set("n", "<leader>b", [[:Neotree action=focus source=buffers position=float toggle<CR>]])
vim.keymap.set("n", "<leader>gh", [[:Neotree action=focus source=git_status position=float toggle<CR>]])


-- Code Actions --
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")

-- Signature
vim.keymap.set({ "n" }, "<C-Space>", function()
	require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

vim.keymap.set({ "n" }, "<Leader>k", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- Mason
vim.keymap.set("n", "<leader>ms", [[:Mason<CR>]], { desc = "Open Mason" })

-- Harpoon --
vim.keymap.set('n', "<C-b>", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', "<C-n>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', "<S-l>", ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', "<S-h>", ':lua require("harpoon.ui").nav_prev()<CR>')

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- AVANTE --
vim.keymap.set("n", "<leader>cn", ":AvanteChatNew<CR>", { desc = "Open Avante Chat" })
vim.keymap.set("n", "<C-/>", ":AvanteChat<CR>", { desc = "Open Avante Chat" })

-- Solana Seeds --
vim.keymap.set("n", "<leader>x", [[:Seeds<CR>]], { desc = "write them seeds" })
