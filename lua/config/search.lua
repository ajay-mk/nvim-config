local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    height = 0.85,
    width = 0.85,
    border = "rounded",
    preview = { layout = "vertical", vertical = "down:55%" },
  },
})

local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map("<leader>ff", fzf.files, "Find files")
map("<leader>fg", fzf.live_grep, "Live grep")
map("<leader>fG", fzf.grep_cword, "Grep word under cursor")
map("<leader>fb", fzf.buffers, "Buffers")
map("<leader>fh", fzf.help_tags, "Help tags")
map("<leader>fk", fzf.keymaps, "Keymaps")
map("<leader>fs", fzf.lsp_document_symbols, "Document symbols")
map("<leader>fS", fzf.lsp_live_workspace_symbols, "Workspace symbols")
map("<leader>fr", fzf.lsp_references, "References")
map("<leader>fd", fzf.diagnostics_document, "Document diagnostics")
map("<leader>fD", fzf.diagnostics_workspace, "Workspace diagnostics")
map("<leader>fR", fzf.resume, "Resume last picker")
