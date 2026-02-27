return {
  {
    "doums/darcula",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("darcula")
    end,
  },
  { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
}
