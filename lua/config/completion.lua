require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "normal" },
  completion = {
    accept = { auto_brackets = { enabled = true } },
    documentation = { auto_show = true, auto_show_delay_ms = 250 },
    menu = { border = "rounded" },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = { enabled = true },
  fuzzy = { implementation = "lua" },
})
