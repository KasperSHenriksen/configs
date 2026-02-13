require("core.options")
require("core.keymaps")

-- LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- File Manager --
	--require("plugins.neotree"),
    require("plugins.fyler"),

	require("plugins.tiny-inline-diagnostic"),
	require("plugins.colortheme"),
	--require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	--require("plugins.telescope"),
	require("plugins.blink"),
    --require("plugins.autocompletion"),
    require("plugins.lsp"),
	require("plugins.alpha"),
	require("plugins.uv"),
	--require("plugins.toggleterm"),

    -- Misc --
	require("plugins.smear-cursor"),
	require("plugins.misc"),
    require('plugins.render_markdown'),

    -- Git and Test --
	require("plugins.gitsigns"),
	require("plugins.neogit"),
	require("plugins.todo-comments"),
	require("plugins.neotest"),
	require("plugins.codediff"),

    -- Search / Find --
    require("plugins.fff"),
    require("plugins.fzf"),
    require("plugins.namu"),
})

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({
    --ensure_installed = { "pyright" },
})
-- LSP: Goto definition --
vim.keymap.set('n', 'gd', ':FzfLua lsp_definitions<CR>')
vim.keymap.set('n', 'gD', ':FzfLua lsp_declarations<CR>')
vim.keymap.set('n', 'gr', ':FzfLua lsp_references<CR>')



-- Key Setup
local wk = require("which-key")
wk.add({
    --{"<leader>å", ":ToggleTerm<CR>", desc="Open terminal", mode="n"},

    -- Group: Testing --
    {"<leader>t", group="Testing"},
    {"<leader>tt", function() require("neotest").run.run() end, desc="Run nearest test", mode="n"},
    {"<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc="Run test file", mode="n"},
    {"<leader>to", function() require("neotest").output.open({ enter = true }) end, desc="Run test output", mode="n"},
    {"<leader>ts", function() require("neotest").summary.toggle() end, desc="Toggle test summary", mode="n"},

    -- Group: Git + Diff --
    {"<leader>g", group="Git Tools"},
    {"<leader>gg", ":Neogit<CR>", desc="Neogit", mode="n"},

    --{"<leader>d", group="Diff Tools"},
    --{"<leader>do", ":DiffViewOpen<CR>", desc="Diffview ([O]pen)", mode="n"},
    --{"<leader>dc", ":DiffViewClose<CR>", desc="Diffview ([C]lose)", mode="n"},
    --{"<leader>dd", ":diffthis<CR>", desc="Diff [T]his file", mode="n"},
    {"<leader>dd", ":CodeDiff<CR>", desc="Diff dir", mode="n"},

    -- Files & Search --
    {"<leader>f", group="Find"},
    {"<leader>fe", ":Fyler kind=float<CR>", desc="(E)xplorer", mode="n"},
    {"<leader>ff", ":FFFFind<CR>", desc="(F)ile", mode="n"},
    {"<leader>fg", ":FzfLua live_grep_native<CR>", desc="(G)rep", mode="n"},
})

-- Yank into system clipboard
--vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
--vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
--vim.keymap.set({'n', 'v'}, '<leader>d', '"+d') -- delete motion
--vim.keymap.set({'n', 'v'}, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
--vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
--vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor

--wk.add({
--    t = {
--        name = "Testing",
--        t = { function() require("neotest").run.run() end, "Run nearest test" },
--        f = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Run test file" },
--        o = { function() require("neotest").output.open({ enter = true }) end, "Open test output" },
--        s = { function() require("neotest").summary.toggle() end, "Toggle test summary" },
--
--    }
--}, {prefix = "<leader>"})
