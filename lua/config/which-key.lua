require("which-key").setup({
  preset = "modern",
  delay = 300,
  win = {
    border = "rounded",
  },
  spec = {
    { "<leader>c", group = "cmake" },
    { "<leader>d", group = "debug" },
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>h", group = "hunks" },
    { "<leader>l", group = "lsp" },
    { "<leader>n", group = "project tree" },
    { "<leader>t", group = "terminal" },
  },
})
