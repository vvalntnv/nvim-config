return {
  "hrsh7th/nvim-cmp", -- The plugin specification
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.preselect = cmp.PreselectMode.None
    cmp.setup({
      preselect = cmp.PreselectMode.None,
    })
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      -- Remap <Tab> to confirm
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      -- Optional: Remap <S-Tab> to navigate backwards
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<CR>"] = cmp.config.disable,
    })
  end,
}
