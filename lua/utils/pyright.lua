local M = {}

--- Toggle if the pyright client should have strict typing enabled
--- @param enabled boolean
function M.toggle_type_check_python(enabled)
	local pyright = vim.lsp.get_clients({name = "pyright"})[1]

	if pyright then
		pyright.notify('workspace/didChangeConfiguration', {
			settings = {
				python = {
					analysis = {
						typeCheckingMode = enabled and "on" or "off"
					}
				}
			}
		})
	else
		print("Maikata si eba")
	end
end

return M
