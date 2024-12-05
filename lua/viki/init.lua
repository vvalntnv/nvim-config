require("viki.tree")
require("viki.remap")
require("viki.packer")
require("viki.set")
require("viki.theme")
vim.cmd("colorscheme tokyonight-night")

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

-- React (JSX/TSX) specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascriptreact", "typescriptreact", "css", "typescript", "javascript" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = true
    end,
})


vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
