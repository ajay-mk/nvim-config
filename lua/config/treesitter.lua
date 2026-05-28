local parsers = {
  "bash",
  "c",
  "cpp",
  "cmake",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "query",
  "vim",
  "vimdoc",
  "yaml",
}

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
  pattern = parsers,
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
  end,
})
