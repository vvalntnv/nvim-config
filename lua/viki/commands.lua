local notes_functions = require('utils.dir_utils')
local pyright_utils = require('utils.pyright')
local line_wrap = require('utils.wrapped_lines')

vim.api.nvim_create_user_command('DeveloperNotes', function (opts)
	local name = opts.args or nil
	notes_functions.create_local_notes_directory(name)
end, { nargs = "?" })

vim.api.nvim_create_user_command("EnableTypeCheck", function (opts)
	pyright_utils.toggle_type_check_python(true)
end, { nargs = 0 })

vim.api.nvim_create_user_command("DisableTypeCheck", function ()
	pyright_utils.toggle_type_check_python(false)
end, { nargs = 0})

vim.api.nvim_create_user_command("LineWrap", function ()
	line_wrap.line_wrapping()
end, { nargs = 0})
