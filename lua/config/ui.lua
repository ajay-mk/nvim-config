vim.cmd("colorscheme tender")

local function set_comment_hl()
  local hl = { fg = "#8a9a55" }
  vim.api.nvim_set_hl(0, "Comment", hl)
  vim.api.nvim_set_hl(0, "@comment", hl)
  vim.api.nvim_set_hl(0, "@comment.line", hl)
  vim.api.nvim_set_hl(0, "@comment.documentation", hl)
  vim.api.nvim_set_hl(0, "@lsp.type.comment", hl)
end

set_comment_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_comment_hl })


require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = "none",
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = "thin",
    always_show_bufferline = true,
    offsets = {
      { filetype = "NvimTree", text = "Files", text_align = "left", separator = true },
    },
  },
})

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "diagnostics", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
