--return {
--  'dmtrKovalenko/fff.nvim',
--  build = 'cargo build --release',
--  -- or if you are using nixos
--  -- build = "nix run .#release",
--  opts = { -- (optional)
--    debug = {
--      enabled = true,     -- we expect your collaboration at least during the beta
--      show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
--    },
--  },
--  -- No need to lazy-load with lazy.nvim.
--  -- This plugin initializes itself lazily.
--  lazy = false,
--  --keys = {
--  --  {
--  --    "ff", -- try it if you didn't it is a banger keybinding for a picker
--  --    function() require('fff').find_files() end,
--  --    desc = 'FFFind files',
--  --  }
--  --}
--}

return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    -- downloads a prebuilt binary or falls back to cargo build
    require("fff.download").download_or_build_binary()
  end,
  -- for nixos:
  -- build = "nix run .#release",
  opts = {
    debug = {
      enabled = true,
      show_scores = true,
    },
  },
  lazy = false, -- the plugin lazy-initialises itself
  --keys = {
  --  { "ff", function() require('fff').find_files() end, desc = 'FFFind files' },
  --  { "fg", function() require('fff').live_grep() end, desc = 'LiFFFe grep' },
  --  { "fz",
  --    function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
  --    desc = 'Live fffuzy grep',
  --  },
  --  { "fw",
  --    function() require('fff').live_grep_under_cursor() end,
  --    mode = { 'n', 'x' },
  --    desc = 'Search current word / selection',
  --  },
  --},
}
