---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
local overrides = require "custom.configs.overrides"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = overrides.ui.statusline,
  tabufline = overrides.ui.tabufline,
  nvdash = overrides.ui.nvdash,
  telescope = overrides.ui.telescope,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
