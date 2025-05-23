local M = {}

--- Gets the currently selected text in visual mode
--- @return string|string[] The selected text
function M.get_selected_text()
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")

	local line_start = vstart[2]
	local line_end = vend[2]

	local lines = vim.fn.getline(line_start, line_end);
	return lines
end

return M
