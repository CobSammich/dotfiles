-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "doomchad",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = {
  load_on_startup = true,
  -- buttons = {
  --   { txt = "  Find File", "Telescope find_files" },
  --   { txt = "󰈚  Recent Files", "Telescope oldfiles" },
  --   { txt = "󰂖  Recent Projects", "Telescope projects" },
  --   { txt = "󰈭  Find Word", "Telescope live_grep" },
  --   { txt = "  Bookmarks", "Telescope marks" },
  --   { txt = "  Themes", "Telescope themes" },
  --   { txt = "  Mappings", "NvCheatsheet" },
  -- }
}
M.ui = {
      tabufline = {
         lazyload = false
     }
}

return M
