local notes_functions = require('utils.dir_utils')

vim.api.nvim_create_user_command('DeveloperNotes', function (opts)
	local name = opts.args or nil
	notes_functions.create_local_notes_directory(name)
end, { nargs = "?" })
