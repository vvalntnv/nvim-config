vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true

vim.opt.smartindent = true

-- nvim-dap-python --
require('dap-python').setup('/var/www/wokbox2/.virtualenvs/debugpy/bin/python')
require('dap.ext.vscode').load_launchjs(nil, {})
