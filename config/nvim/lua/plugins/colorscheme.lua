local is_neovide = false
if vim.g.neovide then
  is_neovide = true
end

return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    -- priority = 1000,
    opts = function()
      return {
        transparent = not is_neovide, -- only transparent in terminal
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
