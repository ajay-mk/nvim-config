require("mason").setup({
  ui = {
    border = "rounded",
  },
})

vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Open Mason" })

require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  format_on_save = function(bufnr)
    local disabled = { c = true, cpp = true }
    return {
      timeout_ms = 1000,
      lsp_fallback = not disabled[vim.bo[bufnr].filetype],
    }
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = true,
  },
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--fallback-style=llvm",
    "--header-insertion=iwyu",
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
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      hint = {
        enable = true,
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
        useLibraryCodeForTypes = true,
      },
    },
  },
})

vim.lsp.enable({ "clangd", "lua_ls", "basedpyright" })

local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "List references")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>lf", function()
      require("conform").format({ bufnr = ev.buf, async = false, lsp_fallback = true })
    end, "Format buffer")

    if client:supports_method("textDocument/completion") then
      local completion = client.server_capabilities.completionProvider
      if completion then
        local seen = {}
        local triggers = completion.triggerCharacters or {}
        for _, char in ipairs(triggers) do
          seen[char] = true
        end
        for code = 48, 57 do
          seen[string.char(code)] = true
        end
        for code = 65, 90 do
          seen[string.char(code)] = true
        end
        for code = 97, 122 do
          seen[string.char(code)] = true
        end
        seen["_"] = true

        local chars = {}
        for char in pairs(seen) do
          table.insert(chars, char)
        end
        completion.triggerCharacters = chars
      end

      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      map("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end, "Trigger completion")
    end

    if client:supports_method("textDocument/documentHighlight") then
      local highlight_group = vim.api.nvim_create_augroup("UserLspHighlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = highlight_group,
        buffer = ev.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = highlight_group,
        buffer = ev.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
      map("n", "<leader>li", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
      end, "Toggle inlay hints")
    end

    if client.name == "clangd" then
      map("n", "<leader>ls", function()
        client:request("textDocument/switchSourceHeader", { uri = vim.uri_from_bufnr(ev.buf) }, function(err, result)
          if err then
            vim.notify(err.message, vim.log.levels.ERROR)
            return
          end
          if result then
            vim.cmd.edit(vim.uri_to_fname(result))
          end
        end, ev.buf)
      end, "Switch source/header")
    end
  end,
})
