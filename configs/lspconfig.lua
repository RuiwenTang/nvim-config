local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- clangd
lspconfig['clangd'].setup {
  cmd = {'/Users/tangruiwen/WorkSpace/LLVM/clangd_15.0.1/bin/clangd', '--background-index', '--compile-commands-dir=out/Debug'},
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = true,
  filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto'},
}

-- 
-- lspconfig.pyright.setup { blabla}
