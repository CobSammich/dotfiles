require("impatient")
require("user.core.options")
require("user.core.keymaps")
require("user.core.autocommands")

-- Plugin related
require("user.plugins.plugins")
require("user.plugins.cmp") -- completion
require("user.plugins.treesitter")
require("user.plugins.autopairs")
require("user.plugins.comment")
require("user.plugins.gitsigns")
require("user.plugins.nvim-tree")
require("user.plugins.toggleterm")
require("user.plugins.pydocstring")
require("user.plugins.vim-doge")
require("user.plugins.aerial")
require("user.plugins.dashboard")
require("user.plugins.lualine")
require("user.plugins.bufferline")
require("user.plugins.indent-line")
require("user.plugins.iron")
require("user.plugins.project")


-- LSP related
require("user.lsp") -- this is a directory (searches for init.lua)

-- Colors
require("user.core.colorscheme")
require("user.core.custom_colors")
