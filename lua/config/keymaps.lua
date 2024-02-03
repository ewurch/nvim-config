-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

map("n", "gF", function()
  local file = vim.fn.expand("<cfile>")
  vim.cmd("tabe " .. file)
end, { desc = "Open file under cursor in a new tab", remap = false, silent = true })
