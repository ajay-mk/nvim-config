local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      height = 0.95,
      prompt_position = "top",
      width = 0.92,
    },
    file_ignore_patterns = {
      "^build/",
      "^%.git/",
      "node_modules/",
    },
  },
})

vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
