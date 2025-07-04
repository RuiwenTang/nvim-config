-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.pack.markdown" },
  -- import/override with your plugins folder

  {
    "danymat/neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        javascript = { template = { annotation_convention = "jsdoc" } },
        javascriptreact = { template = { annotation_convention = "jsdoc" } },
        lua = { template = { annotation_convention = "ldoc" } },
        ruby = { template = { annotation_convention = "yard" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
        cpp = { template = { annotation_convention = "doxygen" } },
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      symbol_in_winbar = {
        enable = true,
      },
    },
  },
}
