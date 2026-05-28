local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("echasnovski/mini.nvim"),
  gh("folke/which-key.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("williamboman/mason.nvim"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("nvim-telescope/telescope.nvim"),
  gh("MunifTanjim/nui.nvim"),
  gh("nvim-neo-tree/neo-tree.nvim"),
  gh("lewis6991/gitsigns.nvim"),
  gh("NeogitOrg/neogit"),
  gh("sindrets/diffview.nvim"),
  gh("akinsho/toggleterm.nvim"),
  gh("Civitasv/cmake-tools.nvim"),
  gh("stevearc/conform.nvim"),
  gh("mfussenegger/nvim-dap"),
  gh("rcarriga/nvim-dap-ui"),
  gh("nvim-neotest/nvim-nio"),
}, { load = true, confirm = false })
