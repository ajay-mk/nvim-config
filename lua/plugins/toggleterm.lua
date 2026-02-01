return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Horizontal terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
  },
  opts = {
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    persist_mode = true,
  },
}
