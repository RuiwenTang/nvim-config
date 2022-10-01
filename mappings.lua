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

return M