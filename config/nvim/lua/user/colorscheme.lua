-- set colorscheme as default at first
vim.cmd "colorscheme default"

-- local colorscheme = "spacecamp"
-- local colorscheme = "gruvbox"

-- vim.g.tokyonight_style = "night"
-- vim.g.material_style = "deep ocean"

-- require('onedark').setup {
--   style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--   transparent = false,  -- Show/hide background
--   term_colors = true, -- Change terminal color as per the selected theme style
--   ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--   cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--   -- toggle theme style ---
--   -- toggle_style_key = '<leader>ts', -- Default keybinding to toggle
--   toggle_style_key = '<NOP>',
--   toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
--
--   -- Change code style ---
--   -- Options are italic, bold, underline, none
--   -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--   code_style = {
--     comments = 'italic',
--     keywords = 'none',
--     functions = 'bold',
--     strings = 'none',
--     variables = 'none'
--   },
--
--   -- Custom Highlights --
--   colors = {}, -- Override default colors
--   highlights = {}, -- Override highlight groups
--   integrations = {
--     bufferline = false,
--   },
--
--   -- Plugins Config --
--   diagnostics = {
--     darker = true, -- darker colors for diagnostic
--     undercurl = true,   -- use undercurl instead of underline for diagnostics
--     background = true,    -- use background color for virtual text
--   },
-- }
-- require("onedark").load()

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true, -- will make italic comments and special strings
  inverse = true, -- invert background for search, diffs, statuslines and errors
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  contrast = "", -- can be "hard" or "soft"
  overrides = {},
})


vim.o.background = "dark"
local colorscheme = "gruvbox"

-- Try to set colorscheme -- if it doesn't work then keep as default
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
