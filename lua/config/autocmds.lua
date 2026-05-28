local augroup = function(name)
  return vim.api.nvim_create_augroup("User" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("HighlightYank"),
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("CloseWithQ"),
  pattern = { "help", "qf", "man", "lspinfo", "checkhealth", "fugitive", "fugitiveblame" },
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("LastCursor"),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("FormatOnSave"),
  pattern = { "*.c", "*.cc", "*.cpp", "*.cxx", "*.h", "*.hh", "*.hpp", "*.ipp" },
  callback = function(args)
    if next(vim.lsp.get_clients({ bufnr = args.buf })) then
      vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
    end
  end,
})
