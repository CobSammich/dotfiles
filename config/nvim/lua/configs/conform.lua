local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "isort", "ruff" },
    c = { "clang_format" },
    yaml = { "yamlfmt" },
    rust = { "rustfmt" },
    markdown = { "prettier" },
    vimwiki = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
