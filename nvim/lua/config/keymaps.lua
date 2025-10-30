-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<S-u>", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "J", "<nop>", { desc = "無効化された J" })
vim.keymap.set("n", "K", "<nop>", { desc = "無効化された K" })
