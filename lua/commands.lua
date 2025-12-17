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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf
		if not client or client.name ~= "rust_analyzer" then
			return
		end

		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
})

-- write seeds seemlesly
vim.api.nvim_create_user_command('Seeds', function()
	-- 1. Insert the line below the current cursor
	vim.cmd("normal! olet signer_seeds: &[&[&[u8]]] = &[&[]];")

	-- 2. Move cursor to the end, find the last '[', and enter Append mode
	vim.cmd("normal! $F];")

	-- 3. Explicitly start insert mode (ensures you are ready to type)
	vim.cmd("startinsert")
end, {})
