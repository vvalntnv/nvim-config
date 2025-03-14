-- Pyright conf
require("lspconfig").pyright.setup({

})

-- Lua Lang server
require('lspconfig').lua_ls.setup {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				library = {
					vim.fn.stdpath("config"), -- ~/.config/nvim
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("data") .. "/lazy", -- If using lazy.nvim
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
		}
	}
}
