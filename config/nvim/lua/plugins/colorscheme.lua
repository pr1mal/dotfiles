function is_neovide()
  if vim.g.neovide then
    return true
  else
    return false
  end
end

return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    -- priority = 1000,
    opts = function()
      return {
        transparent = not is_neovide(), -- only transparent in terminal
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_contrast = false
      vim.g.nord_borders = true
      vim.g.nord_disable_background = not is_neovide()
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = false
      vim.g.nord_bold = true
    end,
  },
}
