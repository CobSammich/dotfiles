require "core.options"
require "core.keymaps"
require "core.autocommands"

require "plugins.packer"
require "plugins.bufferline"
require "plugins.nvim-tree"
require "plugins.lualine"
require "plugins.indent_blankline"
require "plugins.gitsigns"
require "plugins.telescope"
require "plugins.treesitter"
require "plugins.cmp"
require "plugins.project"
require "plugins.aerial"
require "plugins.vim-doge"
require "plugins.autopairs"
require "plugins.colorizer"

require "lsp.lsp"

-- Single line setups:
require('Comment').setup()
require('fidget').setup()
