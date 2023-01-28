local overrides = require "custom.plugins.overrides"

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter
  },

  ["williamboman/mason.nvim"] = {override_options = overrides.mason},

  ["kyazdani42/nvim-tree.lua"] = {override_options = overrides.nvimtree},

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function() require("better_escape").setup() end
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function() require "custom.plugins.null-ls" end
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require("toggleterm").setup({open_mapping = [[<c-\>]]})
    end
  },

  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      cfg = {
        doc_lines = 10,
        max_height = 12,
        max_width = 80,
        wrap = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        toggle_key = "<M-x>"
      }
      require("lsp_signature").setup(cfg)
    end
  },
  ["p00f/clangd_extensions.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"
      local util = lspconfig.util
      local root_files = {
        '.clangd', '.clang-tidy', '.clang-format',
        'compile_commands.json', 'compile_flags.txt', '.git',
        'configure.ac' -- AutoTools
      }
      local default_capabilities = {
        textDocument = {completion = {editsNearCursor = true}},
        offsetEncoding = {'utf-8', 'utf-16'}
      }

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc',
          'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = {noremap = true, silent = true, buffer = bufnr}
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap
        .set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa',
          vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr',
          vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
          bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action,
          bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

        require"lsp_signature".on_attach({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {border = "rounded"}
        }, bufnr)
      end

      require("clangd_extensions").setup {
        server = {
          cmd = {
            'clangd', "--background-index",
            "--compile-commands-dir=build"
          },
          on_attach = on_attach,
          capabilities = default_capabilities,
          single_file_support = true,
          filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto'},
          root_dir = function(fname)
            return util.root_pattern(unpack(root_files))(fname) or
              util.find_git_ancestor(fname)
          end
        },
        extensions = {
          autoSetHints = true,
          inlay_hints = {
            only_current_line = false,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            highlight = "Comment"
          }
        }
      }

    end
  },
  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })

    end
  },
  ["danymat/neogen"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('neogen').setup {
        languages = {
          ['cpp.doxygen'] = require('neogen.configurations.cpp')
        },
      }
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    requires = {"mfussenegger/nvim-dap"},
    function ()
      require 'custom.plugins.dap'
    end
  }

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
