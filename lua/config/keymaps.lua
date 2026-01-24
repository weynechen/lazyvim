-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open dashboard
vim.keymap.set("n", "<leader>h", function()
  require("snacks").dashboard()
end, { desc = "Dashboard" })
