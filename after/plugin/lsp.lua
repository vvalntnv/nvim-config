local lsp_zero = require('lsp-zero')
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local lsp_config = require("lspconfig")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
  })
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {"pyright", "rust_analyzer"}, -- Include Pyright here
    handlers = {
		lsp_zero.default_setup,
    },
})

lsp_config.pyright.setup {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "on"
			}
		}
	}
}


-- Rust tools
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

lsp_config.rust_analyzer.setup{
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false
			}
		}
	}
}
