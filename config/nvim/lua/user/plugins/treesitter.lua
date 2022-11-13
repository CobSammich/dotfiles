local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml", "lua" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  pyfold = {
    enable = true,
    custom_foldtext = true -- Sets provided foldtext on window where module is active
  }
}