local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
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

for _, lsp in ipairs(servers) do
  if lsp == "clangd" then
    lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      }
    })
  else
    lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
  vim.diagnostic.config({
    virtual_text = false,
  })
end

--
-- lspconfig.pyright.setup { blabla}
