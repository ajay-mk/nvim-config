return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Clangd setup for C/C++ using new vim.lsp.config API (Neovim 0.11+)
    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    })
    vim.lsp.enable("clangd")

    -- LSP keymaps (set on attach)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
        end

        -- Navigation
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", vim.lsp.buf.references, "Show references")
        map("n", "<leader>D", vim.lsp.buf.type_definition, "Type definition")

        -- Info
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

        -- Actions
        map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>lf", function() vim.lsp.buf.format({ async = false }) end, "Format buffer")

        -- Diagnostics
        map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")

        -- Inlay hints (Neovim 0.11+)
        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          map("n", "<leader>li", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
              { bufnr = args.buf }
            )
          end, "Toggle inlay hints")
        end

        -- Clangd-specific: switch source/header
        if client and client.name == "clangd" then
          map("n", "<leader>ls", function()
            local params = { uri = vim.uri_from_bufnr(0) }
            client:request("textDocument/switchSourceHeader", params, function(err, result)
              if result then vim.cmd.edit(vim.uri_to_fname(result)) end
            end)
          end, "Switch source/header")
        end
      end,
    })

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    })
  end,
}
