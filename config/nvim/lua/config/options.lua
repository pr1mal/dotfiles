-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"

  -- disable horizontal scrolling in neovide
  vim.keymap.set("", "<ScrollWheelRight>", "<Nop>", { silent = true })
  vim.keymap.set("", "<ScrollWheelLeft>", "<Nop>", { silent = true })
end

vim.o.relativenumber = false
