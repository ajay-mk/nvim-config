# Keybindings

Leader: `<Space>`. Built-in Neovim 0.11+ LSP defaults (`grn`/`gra`/`grr`/`gri`/`gO`/`K`/`<C-s>`) are active in addition to the maps below. Plugin maps appear only after their plugin loads on the relevant buffer (e.g., LSP maps require an attached client).

## General

| Key | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| `<leader>w` | Write buffer |
| `<leader>q` | Quit window |
| `<leader>Q` | Quit all |
| `<leader>e` | Toggle file tree sidebar (nvim-tree) |
| `<leader>fe` | Reveal current file in the tree |

## Window / Terminal

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move to window left/down/up/right (normal & terminal mode) |
| `<Esc>` (in terminal) | Exit terminal-insert mode |

## Movement

| Key | Action |
|---|---|
| `<C-d>` / `<C-u>` | Half page down/up (re-centered) |
| `n` / `N` | Next/prev search hit (centered & open folds) |
| `</>` (visual) | Outdent/indent and reselect |

## Find (`<leader>f` — fzf-lua)

| Key | Action |
|---|---|
| `<leader>ff` | Files |
| `<leader>fg` | Live grep |
| `<leader>fG` | Grep word under cursor |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fs` | LSP document symbols |
| `<leader>fS` | LSP workspace symbols |
| `<leader>fr` | LSP references |
| `<leader>fd` | Document diagnostics |
| `<leader>fD` | Workspace diagnostics |
| `<leader>fR` | Resume last picker |

## LSP (buffer-local, on attach)

| Key | Action |
|---|---|
| `gd` | Goto definition (fzf-lua) |
| `gD` | Goto declaration |
| `gi` | Goto implementation (fzf-lua) |
| `gr` | References (fzf-lua) |
| `grn` | Rename (native default) |
| `gra` | Code action (native default) |
| `gri` | Implementation (native default) |
| `gO` | Document symbols (native default) |
| `K` | Hover |
| `<C-s>` | Signature help (insert mode, native default) |
| `<leader>ch` | Clangd: switch source/header |
| `<leader>cf` | Format buffer |
| `<leader>cr` | Rename |
| `<leader>ca` | Code action |
| `<leader>ti` | Toggle inlay hints |

## Hunks (`<leader>h` — gitsigns, buffer-local)

| Key | Action |
|---|---|
| `]c` / `[c` | Next/prev hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line (full) |
| `<leader>hd` | Diff this |
| `<leader>ht` | Toggle current-line blame |

## Git (`<leader>g` — fugitive)

| Key | Action |
|---|---|
| `<leader>gs` | `:Git` status window |
| `<leader>gc` | `:Git commit` |
| `<leader>gd` | `:Gdiffsplit` |
| `<leader>gl` | `:Git log --oneline` |
| `<leader>gB` | `:Git blame` (buffer) |
| `<leader>gp` | `:Git pull` |
| `<leader>gP` | `:Git push` |

## Completion (blink.cmp, insert mode)

Default preset: `<Tab>`/`<S-Tab>` navigate, `<CR>` accept, `<C-Space>` trigger, `<C-e>` cancel. See `:h blink-cmp-config-keymap` for the full default map.
