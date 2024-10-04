-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- save buffer on <leader>d
vim.keymap.set({ "x", "n", "s" }, "<leader>d", "<cmd>w<cr><esc>", { desc = "Save file" })
