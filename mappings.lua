local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
  },
}

M.nvimtree = {
    n = {
        ["<leader>nt"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
        ["<C-n>"] = { "<cmd> Telescope <CR>", "open telescope" },
     },
}

-- more keybinds!
--
M.neogen = {
  n = {
    ["<leader>cg"] = { ":lua require('neogen').generate() <CR>" },
  }
}

return M
