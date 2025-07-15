--- Transforms this bulshit string to boolean
--- @param passed_value string
--- @return boolean | nil
local function get_passed_value_boolean_value(passed_value)
	if passed_value == nil then
		return nil
	end

	if type(passed_value) ~= "string" then
		error("somehow you did not pass a string...")
	end

	passed_value = string.lower(passed_value)

	if passed_value ~= "true" and passed_value ~= "false" then
		error("only true/false values are allowed")
	end

	return passed_value == "true"
end

vim.api.nvim_create_user_command('ToggleWrap', function(args)
	-- for key, arg in pairs(args.fargs) do
	-- 	print(key, arg)
	-- end

	local passed_value = get_passed_value_boolean_value(args.fargs[1])

	if passed_value == nil then
		vim.opt.wrap = not vim.opt.wrap._value
	else
		vim.opt.wrap = passed_value
	end

	if vim.opt.wrap._value then
		print('Line wrapping enabled')
		vim.keymap.set('n', 'j', 'gj', { desc = "when wrapping is not enabled, use this" })
		vim.keymap.set('n', 'k', 'gk', { desc = "when wrapping is not enabled, use this" })
	else
		print('Line wrapping disabled')
		vim.keymap.del('n', 'j')
	end
end, { desc = "Enable/disable wrapping", nargs = "?" })
