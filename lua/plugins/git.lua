return {
  -- Neogit: Magit-style Git interface
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit (Git GUI)" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git Commit" },
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Git Push" },
      { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Git Pull" },
      { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Git Log" },
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Git Branch" },
    },
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
    },
  },
  -- Diffview: Visual diffs and merge conflict resolution
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
      { "<leader>gD", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Diff vs Last Commit" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
  -- Fugitive: Keep for :Git blame and quick commands
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite" },
    keys = {
      { "<leader>gB", "<cmd>Git blame<cr>", desc = "Git Blame (Fugitive)" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { buffer = bufnr }

        -- Navigation
        vim.keymap.set("n", "]h", gs.next_hunk, opts)
        vim.keymap.set("n", "[h", gs.prev_hunk, opts)

        -- Actions
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
        vim.keymap.set("n", "<leader>hR", gs.reset_buffer, opts)
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts)
        vim.keymap.set("n", "<leader>hS", gs.stage_buffer, opts)
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)
        vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, opts)
        vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)

        -- Visual mode
        vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, opts)
        vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, opts)
      end,
    },
  },
}
