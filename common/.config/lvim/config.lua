-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- lvim.transparent_window = true

-- Neovide configuration
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"

  -- disable horizontal scrolling
  vim.keymap.set('', '<ScrollWheelRight>', '<Nop>', { silent = true })
  vim.keymap.set('', '<ScrollWheelLeft>',  '<Nop>', { silent = true })
end

local function switch_neosolarized_mode(mode)
  print("solarized mode: " .. mode)
  if not mode then
    return
  end
  local ok_status, NeoSolarized = pcall(require, "NeoSolarized")
  if not ok_status then
    return
  end

  -- Default Setting for NeoSolarized
  NeoSolarized.setup {
    style = mode, -- "dark" or "light"
    transparent = not vim.g.neovide -- transparent if running in terminal
  }
end

lvim.plugins = {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd [[ colorscheme NeoSolarized ]]
    end
  },
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        -- vim.api.nvim_set_option("background", "dark")
        switch_neosolarized_mode("dark")
        vim.cmd("colorscheme NeoSolarized")
      end,
      set_light_mode = function()
        -- vim.api.nvim_set_option("background", "light")
        switch_neosolarized_mode("light")
        vim.cmd("colorscheme NeoSolarized")
      end,
    },
  }
}


