local M = {}

--- Ensures that the directory exists
--- @param dir string: The path of the directory to be created
local function ensure_directory_exists(dir)
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
		print("Directory created: " .. dir)
	else
		print("Directory already exists: " .. dir)
 	end
end

--- Creates a directory for you to take notes
--- @param custom_name string | nil: A custom name for the directory if nothing is specified, then the dir's default name will be `notes`
--- @return string: The directory created
local function create_local_notes_directory(custom_name)
	local notes_name = custom_name or "notes"

	local cwd = vim.fn.getcwd()
	local dir = vim.fs.joinpath(cwd, notes_name)

	ensure_directory_exists(dir)

	return dir
end

M.ensure_directory_exists = ensure_directory_exists
M.create_local_notes_directory = create_local_notes_directory

return M
