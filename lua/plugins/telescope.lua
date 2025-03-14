return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function ()
			require("telescope").load_extension("fzf")
		end
	},
	init = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>gg', builtin.git_files, { desc = 'Get all the git files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		vim.keymap.set('n', '<leader>sd', builtin.lsp_document_symbols, { desc = 'Search symbols in document' })
		vim.keymap.set('n', '<leader>sw', builtin.lsp_workspace_symbols, { desc = 'Search symbols in workspace' })
		vim.keymap.set('n', '<leader>fw', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,

	config = function ()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					}
				}
			}
		})
	end
}
