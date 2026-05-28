require("toggleterm").setup({
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  start_in_insert = true,
  persist_mode = true,
  persist_size = true,
})

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", { desc = "Horizontal terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", { desc = "Vertical terminal" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to lower window" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to upper window" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
