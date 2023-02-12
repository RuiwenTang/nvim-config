local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<leader>gh"] = { "<cmd> ClangdSwitchSourceHeader <CR>", "switch between header and source" },
  },
}

M.nvimtree = {
    n = {
        ["<leader>nt"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
        ["<C-n>"] = { "<cmd> Telescope <CR>", "open telescope" },
     },
}

M.tabufline = {
  n = {
    ["<leader>ct"] = {
      function()
        require("nvchad_ui.tabufline").closeOtherBufs()
      end,
      "close all other tabs"
    }
  }
}

-- more keybinds!
--
M.neogen = {
  n = {
    ["<leader>cg"] = { ":lua require('neogen').generate() <CR>" },
  }
}

return M
