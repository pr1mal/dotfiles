return {
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Symbols Outline (Aerial)" },
    },
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      layout = {
        default_direction = "prefer_right",
      },
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Array",
        "Key",
        "Namespace",
      },
      autojump = true,
      manage_folds = true,
      link_folds_to_tree = true,
      link_tree_to_folds = true,
    },
  },
}
