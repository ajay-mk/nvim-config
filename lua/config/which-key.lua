local wk = require("which-key")

wk.setup({
  delay = 300,
  preset = "modern",
})

wk.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>c", group = "Code" },
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Git" },
  { "<leader>h", group = "Hunk" },
  { "<leader>t", group = "Toggle" },
  { "<leader>u", group = "UI" },
})
