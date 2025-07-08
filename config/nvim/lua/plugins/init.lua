return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

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
        attach_mode = "global",
        highlight_on_hover = true,
        autojump = true,
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
    ft = "tex",
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-pdf",
        },
      }
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  {
    "vimwiki/vimwiki",
    lazy = false,
    event = "BufEnter *.md",
    ft = "md",
    enabled = true,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          template_path = "~/vimwiki/templates/",
          template_default = "default",
          template_ext = ".html",
          syntax = "markdown",
          ext = ".md",
          path_html = "~/vimwiki/site_html/",
          custom_wiki2html = "~/vimwiki/publish_site.py",
        },
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
  },

  -- Auto Doc string
  {
    "kkoomen/vim-doge",
    event = "BufRead",
    config = function()
      vim.cmd [[call doge#install()]]
      vim.cmd [[let g:doge_doc_standard_python = 'numpy']]
      vim.cmd [[let g:doge_python_settings = {
        \ 'single_quotes': 0,
        \ 'omit_redundant_param_types': 0
        \}
      ]]
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
