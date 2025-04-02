return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      transparent = true,  -- Enable transparency
      dimInactive = false,  -- Dim inactive windows
      theme = "dragon",    -- Options: "wave", "dragon", "lotus"
      colors = {
        palette = { sumiInk1 = "#1a1a1a" }, -- Custom dark background
      },
    })
    vim.cmd("colorscheme kanagawa")
  end,
}
