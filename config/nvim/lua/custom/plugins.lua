local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  {
    event = "LspAttach",
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "]", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
  },

  { "kevinhwang91/promise-async" },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   lazy = false,
  --   requires = "kevinhwang91/promise-async",
  --   config = function()
  --     require "custom.configs.ufo"
  --   end,
  -- },

  {
    "lervag/vimtex",
    ft = "tex"
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false
  },

  {
    "vimwiki/vimwiki",
    lazy = false,
    event = "BufEnter *.md",
    ft = "md",
    enabled = true,
    init = function ()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          template_path = '~/vimwiki/templates/',
          template_default = 'default',
          template_ext = '.html',
          syntax = 'markdown',
          ext = '.md',
          path_html = '~/vimwiki/site_html/',
          custom_wiki2html = '~/vimwiki/publish_site.py'
        }
      }
      vim.g.vimwiki_hl_headers = 1
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_markdown_link_ext = 1
      vim.g.vimwiki_conceallevel = 0
    end,
    -- config = function ()
    --   vim.g.vimwiki_markdown_link_ext = 1,
    --   vim.g.vimwiki_conceallevel = 0,
    -- end
  }

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
