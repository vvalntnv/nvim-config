Snacks = require("snacks")
vim.g.moonflyNormalFloat = true

require("remaps")
require("custom.line_wrapper") -- The line-wrapper command
vim.cmd([[set termguicolors]])
vim.cmd([[colorscheme onedark]])

vim.opt.number = true
-- vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.laststatus = 3

vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 4
vim.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.filetype.add({
	extension = {
		twig = "twig"
	}
})

-- React (JSX/TSX) specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascriptreact", "typescriptreact", "css", "typescript", "javascript", "c", "cpp" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.autoindent = true
		vim.opt_local.smartindent = true
	end,
})

-- Linter auto linting
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("after")
