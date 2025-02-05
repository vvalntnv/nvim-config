local dir_utils = require("utils.dir_utils")
local location = dir_utils.get_location_of_dir()

require("no-neck-pain").setup({
    buffers = {
        scratchPad = {
            -- set to `false` to
            -- disable auto-saving
			pathToFile = location,
            enabled = vim.fn.isdirectory(location),
        },
        bo = {
            filetype = "md"
        },
		left = {
			scratchPad = {
				pathToFile = location .. '/developer-logs.md'
			},
			enabled = true
		},
		right = {
			scratchPad = {
				pathToFile = location .. '/todos.md'
			}
		}
    },
})
