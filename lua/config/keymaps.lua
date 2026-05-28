local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Write buffer" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Window left (term)" })
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Window down (term)" })
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Window up (term)" })
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Window right (term)" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search (centered)" })

map("v", "<", "<gv", { desc = "Outdent and reselect" })
map("v", ">", ">gv", { desc = "Indent and reselect" })
