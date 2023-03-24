
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
  }
}
