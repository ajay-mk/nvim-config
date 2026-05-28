vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    width = 35,
    side = "left",
    signcolumn = "no",
    number = false,
    relativenumber = false,
  },
  renderer = {
    icons = {
      show = { file = false, folder = true, folder_arrow = true, git = true },
      glyphs = {
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
        git = {
          unstaged = "M",
          staged = "S",
          unmerged = "U",
          renamed = "R",
          untracked = "?",
          deleted = "D",
          ignored = "I",
        },
      },
    },
    indent_markers = { enable = true },
    highlight_git = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = { "^.git$", "^.DS_Store$" },
  },
  git = { enable = true, ignore = false },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = false,
    },
  },
  update_focused_file = { enable = true, update_root = false },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal current file in tree" })
