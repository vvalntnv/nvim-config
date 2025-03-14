require("remaps")

vim.opt.number = true
vim.opt.guicursor = ""
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true

vim.opt.smartindent = true

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
