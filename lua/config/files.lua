require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = { ".DS_Store" },
    },
  },
  window = {
    position = "left",
    width = 34,
    mappings = {
      ["<space>"] = "none",
    },
  },
  default_component_configs = {
    indent = {
      with_markers = false,
    },
  },
})

vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle filesystem reveal left<cr>", { desc = "Toggle project tree" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus filesystem left<cr>", { desc = "Focus project tree" })
