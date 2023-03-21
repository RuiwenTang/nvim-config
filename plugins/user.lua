
return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function ()
      require('lsp_signature').setup({
        doc_lines = 10,
        max_height = 12,
        max_width = 80,
        wrap = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        toggle_key = "<M-x>"
      })
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function ()
      -- code
      local rt = require('rust-tools')

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    as = "tokyonight",
    config = function ()
      -- code
      require('tokyonight').setup()
    end
  }
}
