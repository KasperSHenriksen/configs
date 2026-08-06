require("core.options")
require("core.keymaps")

-- Treesitter --
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
require("nvim-treesitter").setup()
require("nvim-treesitter").install({
    "lua",
    "python",
    "vim",
    "regex",
    "sql",
    "dockerfile",
    "toml",
    "json",
    "gitignore",
    "yaml",
    "make",
    "cmake",
    "markdown",
    "markdown_inline",
    "bash",
    "html",
    "rust",
    "gdscript",
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})


-- Icons --
--vim.pack.add({
--  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
--})
--require("nvim-web-devicons").setup()
vim.pack.add({ 'https://github.com/nvim-mini/mini.icons' })
require('mini.icons').setup()

-- LSP --
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyrefly",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})


-- Auto Completion --
vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    keymap= {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "accept", "fallback" },
    }
})


-- Colorscheme --
vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim" },
})
require("kanagawa").setup({
  theme = "wave", -- "wave", "dragon", or "lotus"
  transparent = false,
})
vim.cmd.colorscheme("kanagawa")


-- File Explorer -- 
--vim.pack.add({ 'https://github.com/FylerOrg/fyler.nvim' })
--require('fyler').setup()
--vim.keymap.set('n', '<leader>fe', ':Fyler kind=floating<CR>')

vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/ingur/fzf-oil.nvim",
})

require("oil").setup({
    float = require("fzf-oil").float,
    preview_win = require("fzf-oil").preview_win,
})

local browser = require("fzf-oil").setup()

vim.keymap.set("n", "<leader>fe", browser.browse, { desc = "File browser" })


-- File Search --
vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })
--require('fff.download').download_or_build_binary()
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}
vim.keymap.set('n', '<leader>ff', function() require('fff').find_files() end, { desc = 'FFFind files' })
vim.keymap.set('n', '<leader>fg', function() require('fff').live_grep() end, { desc = 'LiFFFe grep' })
--vim.keymap.set('n', '<leader>fw', function() require('fff').live_grep_under_cursor() end, { desc = 'LiFFFe grep' })


-- Symbol Search --
vim.pack.add({
    { src = "https://github.com/bassamsdata/namu.nvim" },
})
require("namu").setup()
--require("namu").setup({
--  options = {
--    movement = {
--      preview = true,
--    },
--  },
--})
vim.keymap.set("n", "<leader>fs", ":Namu treesitter<cr>", { desc = "Jump to LSP symbol", silent = true })


-- Misc --
vim.pack.add({'https://github.com/rachartier/tiny-inline-diagnostic.nvim'})
require('tiny-inline-diagnostic').setup()

vim.pack.add({
  "https://github.com/sphamba/smear-cursor.nvim",
})

require('smear_cursor').setup({})

