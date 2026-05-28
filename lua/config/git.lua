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

map("<leader>gg", function() Snacks.lazygit() end, "Lazygit (full UI)")
map("<leader>gl", function() Snacks.lazygit.log() end, "Lazygit log (repo)")
map("<leader>gf", function() Snacks.lazygit.log_file() end, "Lazygit log (current file)")
map("<leader>go", function() Snacks.gitbrowse() end, "Open in browser (current line)")
vim.keymap.set("v", "<leader>go", function() Snacks.gitbrowse() end, { desc = "Open in browser (selection)" })

vim.api.nvim_create_user_command("GH", function(opts)
  local args = { "gh", "browse" }
  if opts.args ~= "" then table.insert(args, opts.args) end
  vim.system(args)
end, {
  nargs = "?",
  desc = "Open GH PR/issue number in browser (no arg = repo home)",
})
