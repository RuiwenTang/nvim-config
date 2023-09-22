
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
        -- override on_attach
        local on_attach = opts.on_attach
        opts.on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          require("clangd_extensions").setup({
            inlay_hints = {
              inline = vim.fn.has("nvim-0.10") == 1,
              only_current_line = false,
              show_parameter_hints = true,
            }
          })
          require("clangd_extensions.inlay_hints").setup_autocmd()
          require("clangd_extensions.inlay_hints").set_inlay_hints()
        end
        require('lspconfig').clangd.setup(opts)
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
