---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.nvimtree = {
  n = {
    ["<leader>nt"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<C-n"] = {"<cmd> Telescope <CR>", "open telescope"},
  },
}

M.tabufline = {
  n = {
    ["<leader>ct"] = {
      function ()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "close all other tabs"
    }
  }
}

-- more keybinds!

return M
