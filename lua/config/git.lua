require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "^" },
    changedelete = { text = "~" },
  },
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "]h", gs.next_hunk, "Next hunk")
    map("n", "[h", gs.prev_hunk, "Previous hunk")
    map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
    map("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Stage hunk")
    map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
    map("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Reset hunk")
    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, "Blame line")
    map("n", "<leader>hd", gs.diffthis, "Diff this")
  end,
})

require("neogit").setup({
  integrations = {
    diffview = true,
    telescope = true,
  },
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<cr>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", "<cmd>Neogit pull<cr>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log<cr>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gb", "<cmd>Neogit branch<cr>", { desc = "Git branches" })
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open diff view" })
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Close diff view" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history" })
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "Project history" })
