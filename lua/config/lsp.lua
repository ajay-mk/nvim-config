vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  float = { border = "rounded", source = true },
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--fallback-style=llvm",
  },
  init_options = {
    clangdFileStatus = true,
    completeUnimported = true,
    usePlaceholders = true,
  },
  root_markers = {
    ".clangd",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "CMakeLists.txt",
    ".git",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
      diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable({ "clangd", "lua_ls" })

require("lspeek").setup({})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local is_real_file = bufname ~= "" and vim.bo[bufnr].buftype == ""

    if is_real_file and client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("gd", function() require("fzf-lua").lsp_definitions({ jump1 = true }) end, "Goto definition")
    map("gD", vim.lsp.buf.declaration, "Goto declaration")
    map("gi", function() require("fzf-lua").lsp_implementations({ jump1 = true }) end, "Goto implementation")
    map("gr", function() require("fzf-lua").lsp_references({ jump1 = false }) end, "References")
    map("gp", function() require("lspeek").peek_definition() end, "Peek definition")
    map("gP", function() require("lspeek").peek_type_definition() end, "Peek type definition")
    map("<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", "Switch source/header")
    map("<leader>ti", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, "Toggle inlay hints")
    map("<leader>cf", function() vim.lsp.buf.format({ async = false, timeout_ms = 2000 }) end, "Format buffer")
    map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
  end,
})
