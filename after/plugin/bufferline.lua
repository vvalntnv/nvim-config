vim.opt.termguicolors = true

require('bufferline').setup {
    options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        offsets = {
            { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left" }
        }
	}
}
