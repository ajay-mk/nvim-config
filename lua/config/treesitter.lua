local languages = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "diff",
  "git_config",
  "gitcommit",
  "gitignore",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
}

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install(languages)

vim.opt.foldlevelstart = 99

local treesitter_group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = treesitter_group,
  pattern = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "diff",
    "gitcommit",
    "gitconfig",
    "gitignore",
    "json",
    "lua",
    "markdown",
    "python",
    "query",
    "toml",
    "vim",
    "yaml",
  },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
  end,
})
