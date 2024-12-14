-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps

vim.keymap.set("n", "<leader>ss", ":w<CR>", { noremap = true, silent = true, desc = "Save" })
