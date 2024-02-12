local lsp_zero = require('lsp-zero')
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

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
  ensure_installed = {"rust_analyzer"},
  handlers = {
    lsp_zero.default_setup,
  },
})
