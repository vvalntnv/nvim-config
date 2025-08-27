local neotest = require("neotest")

vim.api.nvim_create_user_command("RunFileTests", function()
	neotest.run.run()
end, {})

-- TODO: Some sunny day I will finish this shit
-- Debugging and tests are not a problem as I am used to the
-- Python debugger.
-- (I am lazy)
-- (I do not want to do GRUNT WORK 🤓)
vim.api.nvim_create_user_command("DebugFileTests", function()
	neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
end, {})

vim.keymap.set("n", "<leader>ts", function()
	neotest.run.stop()
end)

vim.keymap.set("n", "<leader>d", function()
	neotest.diagnostic()
end, {})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.j2", "*.jinja", "*.jinja2", "*/templates/*.html" },
	callback = function()
		vim.bo.filetype = "htmldjango"
	end,
})
