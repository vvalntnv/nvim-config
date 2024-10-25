vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    numbers = "ordinal",  -- Show buffer numbers (e.g., 1, 2, 3...) on each tab
    -- Optional: add other customizations for bufferline
    diagnostics = "nvim_lsp",  -- Show LSP diagnostics on bufferline
    separator_style = "slant", -- Customize separator style (e.g., slant, thick)
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left" }
    },
    -- You can add more options here
  }
}
