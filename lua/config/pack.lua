local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("doums/darcula"),
  gh("nvim-lualine/lualine.nvim"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("folke/which-key.nvim"),
  gh("ibhagwan/fzf-lua"),
  gh("nvim-tree/nvim-tree.lua"),
  gh("saghen/blink.lib"),
  gh("saghen/blink.cmp"),
  gh("lewis6991/gitsigns.nvim"),
  gh("tpope/vim-fugitive"),
}, { load = true, confirm = false })
