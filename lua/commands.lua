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

		vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
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

local function get_comment_parts()
	local cs = vim.bo.commentstring

	if cs == "" then
		cs = "// %s"
	end

	local before, after = cs:match("^(.*)%%s(.*)$")

	return before or "", after or ""
end


-- NORMAL MODE: insert single review comment above cursor
vim.api.nvim_create_user_command("ReviewComment", function()
	local before, after = get_comment_parts()

	local line = before .. "ReviewComment: " .. after

	local row = vim.api.nvim_win_get_cursor(0)[1]

	vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { line })

	vim.api.nvim_win_set_cursor(0, { row, #before + #"ReviewComment: " })

	vim.cmd("normal! $")
	vim.cmd("startinsert")
end, {})


-- VISUAL MODE: wrap selection with ReviewComment block
vim.api.nvim_create_user_command("ReviewCommentBlock", function()
	local before, after = get_comment_parts()

	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	local start_comment =
		string.format(
			"%sReviewComment (through lines %d-%d): %s",
			before,
			start_line + 1,
			end_line + 1,
			after
		)

	local end_comment =
		string.format(
			"%sEndReviewComment%s",
			before,
			after
		)

	-- insert end first (so indices don't shift)
	vim.api.nvim_buf_set_lines(0, end_line, end_line, false, { end_comment })

	vim.api.nvim_buf_set_lines(0, start_line - 1, start_line - 1, false, { start_comment })

	vim.api.nvim_win_set_cursor(0, { start_line, #before + #"ReviewComment (through lines ): " })

	vim.cmd("normal! $")
	vim.cmd("startinsert")
end, { range = true })
