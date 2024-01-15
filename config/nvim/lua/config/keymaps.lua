-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- resize windows
keymap.set("n", "<A-w>k", "<cmd>resize +4<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-w>j", "<cmd>resize -4<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-w>l", "<cmd>vertical resize +4<cr>", { desc = "Increase window width" })
keymap.set("n", "<A-w>h", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
