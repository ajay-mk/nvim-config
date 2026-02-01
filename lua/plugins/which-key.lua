return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = false },
    },
    win = {
      border = "rounded",
    },
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "cmake" },
      { "<leader>d", group = "debug" },
      { "<leader>f", group = "find/file" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "hunk" },
      { "<leader>t", group = "terminal" },
    },
  },
}
