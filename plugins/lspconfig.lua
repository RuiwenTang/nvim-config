local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require 'lspconfig.util'

-- local servers = { "clangd" }

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end



lspconfig['cmake'].setup {
  filetypes = { 'cmake' },
  init_options = { 
    buildDirectory = "build" 
  },
}
