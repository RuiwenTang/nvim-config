
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
  },
  {
  'Wansmer/symbol-usage.nvim',
    event = 'LspAttach', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require('symbol-usage').setup()
    end
  },
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  -- barbecue
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function ()
      -- code
      vim.opt.updatetime = 200

      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
        theme = "catppuccin",
        dim_dirname = true,
        alt_background = false,
      })

      vim.api.nvim_create_autocmd({
        -- "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "WinResized",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  }
}
