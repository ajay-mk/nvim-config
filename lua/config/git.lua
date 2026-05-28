require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("]c", function() gs.nav_hunk("next") end, "Next hunk")
    map("[c", function() gs.nav_hunk("prev") end, "Prev hunk")
    map("<leader>hs", gs.stage_hunk, "Stage hunk")
    map("<leader>hr", gs.reset_hunk, "Reset hunk")
    map("<leader>hp", gs.preview_hunk, "Preview hunk")
    map("<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
    map("<leader>hd", gs.diffthis, "Diff this")
    map("<leader>ht", gs.toggle_current_line_blame, "Toggle line blame")
  end,
})

local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map("<leader>gs", "<cmd>Git<cr>", "Git status")
map("<leader>gc", "<cmd>Git commit<cr>", "Git commit")
map("<leader>gd", "<cmd>Gdiffsplit<cr>", "Git diff (split)")
map("<leader>gl", "<cmd>Git log --oneline<cr>", "Git log")
map("<leader>gB", "<cmd>Git blame<cr>", "Git blame (buffer)")
map("<leader>gp", "<cmd>Git pull<cr>", "Git pull")
map("<leader>gP", "<cmd>Git push<cr>", "Git push")
