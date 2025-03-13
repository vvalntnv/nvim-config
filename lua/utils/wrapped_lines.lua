local M = {}
local is_set = false

function M.line_wrapping()
	if not is_set then
		vim.keymap.set({'n', 'v'}, "j", "gj")
		vim.keymap.set({'n', 'v'}, "k", "gk")
		print("Line wrapping remaps enabled")
	else
		vim.keymap.del({'n', 'v'}, "j")
		vim.keymap.del({'n', 'v'}, "k")
		print("Line wrapping remaps DISABLED (like your mum)")
	end

	is_set = not is_set
end

return M
