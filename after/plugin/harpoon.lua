local function add_to_harpoon_on_open()
    local ok, harpoon = pcall(require, "harpoon.mark")
    if not ok then
        print("Harpoon not installed")
        return
    end

    -- Add the current buffer's file to Harpoon
    harpoon.add_file()
end

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = add_to_harpoon_on_open,
    desc = "Add buffer file to Harpoon on open",
})



local function clear_harpoon_on_exit()
    local ok, harpoon = pcall(require, "harpoon.mark")
    if not ok then
        print("Harpoon not installed")
        return
    end
    harpoon.clear_all()
end

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = clear_harpoon_on_exit,
    desc = "Clear all Harpoon files on Neovim exit",
})

