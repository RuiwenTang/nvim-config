
return {
  n = {
    ["<leader>sh"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "clangd switch source and header" },
    -- lsp config mappings
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show LSP hover" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Go to implementation" },
    ["<leader>D"] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Lsp type definition" },
  },
}
