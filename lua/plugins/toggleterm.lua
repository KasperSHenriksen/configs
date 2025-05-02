return {
    -- amongst your other plugins
    --{ "akinsho/toggleterm.nvim", version = "*", config = true },
    -- or
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>"),
            --vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>")
        },
    },
}
