local builtins = require("null-ls.builtins")
local formatting = builtins.formatting
-- local completion = builtins.completion
-- local diagnostics = builtins.diagnostics
-- local code_actions = builtins.code_actions

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ FORMATTING ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

-- register any number of sources simultaneously
local sources = {}
local ld = false

if vim.fn.executable("djlint") == 1 then
	ld = true
	sources[#sources+1] = formatting.djlint.with({
		command = "djlint",
		args = { "--reformat", "-"},
	})
end

local keymap = vim.api.nvim_set_keymap
keymap('n', '<Space>fm', '<ESC>:lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})

