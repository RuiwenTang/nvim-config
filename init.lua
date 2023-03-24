
return {
  colorscheme = "one_monokai",

  lsp = {
    setup_handlers = {
      -- custom handler
      -- rust
      rust_analyzer = function(_ , opts)
        require('rust-tools').setup { server = opts }
      end,
      -- clangd
      clangd = function(_, opts)
        require("clangd_extensions").setup { server = opts }
      end,
    },
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
  },
  
  polish = function ()
    -- code
    vim.filetype.add({
      extension = {
        comp = 'glsl',
        frag = 'glsl',
        vert = 'glsl',
        geom = 'glsl',
      }
    })
  end
}
