local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- FORMATTING
  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "markdown", "vimwiki" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- rust
  b.formatting.rustfmt,

  -- yaml
  b.formatting.yamlfmt,

  -- python
  b.formatting.isort,
  b.formatting.black,
  -- b.formatting.black.with({
  --   extra_args = { "--line-length=80" }
  -- }),

  -- DIAGNOSTICS / LSP
  b.diagnostics.ruff,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
