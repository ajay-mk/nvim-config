local M = {}

local has_clang_format_cache = {}

function M.config_path(file)
  local dir = (file and file ~= "") and vim.fs.dirname(file) or vim.fn.getcwd()
  local found = vim.fs.find(".pre-commit-config.yaml", { upward = true, path = dir, limit = 1 })
  return found[1]
end

function M.has_clang_format(cfg_path)
  if not cfg_path then return false end
  local cached = has_clang_format_cache[cfg_path]
  if cached ~= nil then return cached end

  local result = false
  local f = io.open(cfg_path, "r")
  if f then
    for line in f:lines() do
      if line:match("id:%s*clang%-format") then
        result = true
        break
      end
    end
    f:close()
  end
  has_clang_format_cache[cfg_path] = result
  return result
end

function M.run(file, hook_id)
  if vim.fn.executable("pre-commit") == 0 then
    vim.notify("pre-commit not installed", vim.log.levels.WARN, { title = "pre-commit" })
    return
  end
  local cfg = M.config_path(file)
  if not cfg then
    vim.notify("No .pre-commit-config.yaml in any parent dir", vim.log.levels.WARN, { title = "pre-commit" })
    return
  end

  local args = { "pre-commit", "run", "--files", file }
  if hook_id then
    table.insert(args, 3, hook_id)
  end

  vim.system(args, { cwd = vim.fs.dirname(cfg), text = true }, function(obj)
    vim.schedule(function()
      vim.cmd("silent! checktime")
      if obj.code ~= 0 and not hook_id then
        local out = (obj.stdout or "") .. (obj.stderr or "")
        vim.notify(out ~= "" and out or "pre-commit failed", vim.log.levels.WARN, { title = "pre-commit" })
      end
    end)
  end)
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("UserPreCommitClangFormat", { clear = true }),
  pattern = { "*.c", "*.cc", "*.cpp", "*.cxx", "*.h", "*.hh", "*.hpp", "*.ipp" },
  callback = function(args)
    local cfg = M.config_path(args.file)
    if M.has_clang_format(cfg) then
      M.run(args.file, "clang-format")
    end
  end,
})

vim.keymap.set("n", "<leader>cF", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("Buffer has no file", vim.log.levels.WARN, { title = "pre-commit" })
    return
  end
  vim.notify("Running pre-commit on " .. vim.fs.basename(file) .. "...",
    vim.log.levels.INFO, { title = "pre-commit" })
  M.run(file)
end, { desc = "Run all pre-commit hooks on current file" })

return M
