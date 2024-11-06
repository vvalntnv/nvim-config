require("viki.remap")
require("viki.packer")
require("viki.set")
require("viki.theme")
vim.cmd("colorscheme kanagawa")
vim.filetype.add({
  extension = {
    htmldjango = 'htmldjango',
  }
})

vim.opt.colorcolumn = "80"

-- Change the ColorColumn highlight group to set the background color
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "#2E2E2E" })
require("scope").setup({})
require("telescope").load_extension("scope")
