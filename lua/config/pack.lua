local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("doums/darcula"),
  gh("navarasu/onedark.nvim"),
  gh("catppuccin/nvim"),
  gh("folke/tokyonight.nvim"),
  gh("rebelot/kanagawa.nvim"),
  gh("ellisonleao/gruvbox.nvim"),
  gh("jacoborus/tender.vim"),
  gh("nvim-lualine/lualine.nvim"),
  gh("akinsho/bufferline.nvim"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("folke/which-key.nvim"),
  gh("ibhagwan/fzf-lua"),
  gh("nvim-tree/nvim-tree.lua"),
  gh("folke/snacks.nvim"),
  gh("nvim-lua/plenary.nvim"),
  gh("Civitasv/cmake-tools.nvim"),
  gh("saghen/blink.lib"),
  gh("saghen/blink.cmp"),
  gh("lewis6991/gitsigns.nvim"),
  gh("r4ppz/lspeek.nvim"),
}, { load = true, confirm = false })
