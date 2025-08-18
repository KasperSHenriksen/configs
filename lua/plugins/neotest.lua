return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    --- Adapters ---
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
      },
    })
  end,
    

--    vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, {desc = 'Neotest - Run'}),
--    vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, {desc = 'Neotest - Run file'}),
--    vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = 'Neotest - Output'}),
--    vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = 'Neotest - Toggle'}),
        --vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>")
  --vim.keymap.set('n', '<leader>gg', ":Neogit<CR>", { desc = 'Neogit' }),
}

