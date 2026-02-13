return {
    "bassamsdata/namu.nvim",
    opts = {
        global = { },
        namu_symbols = { -- Specific Module options
            options = {},
        },
    },
    -- === Suggested Keymaps: ===
    vim.keymap.set("n", "<leader>fs", ":Namu symbols<cr>", {
        desc = "LSP (S)ymbol",
        silent = true,
    }),
    vim.keymap.set("n", "<leader>fw", ":Namu workspace<cr>", {
        desc = "LSP Symbols - (W)orkspace",
        silent = true,
    })
}
