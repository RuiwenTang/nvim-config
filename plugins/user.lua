
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
  -- rust tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
  },
  -- clangd extensions
  {
    "p00f/clangd_extensions.nvim",
    ft = "cpp",
  },
  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    as = "one_monokai",
    config = function ()
      -- code
      require('one_monokai').setup()
    end
  },
  -- move
  {
    'echasnovski/mini.move',
    version = '*',
    event = 'BufRead',
    config = function ()
      -- code
      require('mini.move').setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<S-left>',
          right = '<S-right>',
          down = '<S-down>',
          up = '<S-up>',

          -- Move current line in Normal mode
          line_left = '<S-left>',
          line_right = '<S-right>',
          line_down = '<S-down>',
          line_up = '<S-up>',
        },
      })
    end
  },
  -- trouble
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'BufRead',
    config = function ()
      -- code
      require('trouble').setup()
    end
  },
  -- flash.nvim
  {
    'folke/flash.nvim',
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
  }
}
