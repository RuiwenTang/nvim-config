
return {
  colorscheme = "catppuccin",

  lsp = {
    setup_handlers = {
      -- custom handler
      -- rust
      rust_analyzer = function(_ , opts)
        require('rust-tools').setup { server = opts }
      end,
      -- clangd
      clangd = function(_, opts)
        require('lspconfig').clangd.setup(opts)
        require("clangd_extensions").setup {}
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
  options = {
    g = {
      autoformat_enabled = false,
    }
  },
  
  polish = function ()
    -- code
    vim.filetype.add({
      extension = {
        comp = 'glsl',
        frag = 'glsl',
        vert = 'glsl',
        geom = 'glsl',
        mm = 'cpp',
      }
    })
  end
}
