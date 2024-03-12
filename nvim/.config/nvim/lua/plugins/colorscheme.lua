return {
  {
    "catppuccin/nvim",
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = true,
    }),
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
