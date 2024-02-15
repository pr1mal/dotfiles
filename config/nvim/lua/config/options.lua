-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- vim.g.neovide_transparency = 0 --.95
  -- vim.g.transparency = 0.85
  -- vim.g.neovide_window_blurred = true
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()

  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_hide_mouse_when_typing = true

  -- disable horizontal scrolling in neovide
  vim.keymap.set("", "<ScrollWheelRight>", "<Nop>", { silent = true })
  vim.keymap.set("", "<ScrollWheelLeft>", "<Nop>", { silent = true })
end

vim.o.relativenumber = true
