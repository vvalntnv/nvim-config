return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
			-- Explicitly load Snacks types when "Snacks" is typed
			{ path = "snacks.nvim",        words = { "Snacks" } },
			-- Always load lazy.nvim
			"lazy.nvim",
		},
	},
}
