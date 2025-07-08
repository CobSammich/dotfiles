require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "clangd",
  "pyright",
  "rust_analyzer",
  "texlab",
  "dockerls",
  "marksman",
  "csharp_ls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
