require("viki.remap")
require("viki.packer")
require("viki.set")
require("viki.theme")

vim.cmd("colorscheme catppuccin")

vim.filetype.add({
  extension = {
    htmldjango = 'htmldjango',
  }
})
