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

## Make / CMake (`<leader>m` — cmake-tools)

| Key | Action |
|---|---|
| `<leader>mg` | Generate (configure project) |
| `<leader>mb` | Build (last preset + target) |
| `<leader>mr` | Run selected target |
| `<leader>mt` | Run tests (`ctest`) |
| `<leader>mp` | Pick preset from `CMakePresets.json` / `CMakeUserPresets.json` |
| `<leader>mT` | Pick target from `CMakeLists.txt` |
| `<leader>mc` | Clean build |
| `<leader>ms` | Stop running build |
| `<leader>mo` | Toggle build-output window |

## Terminal / Run

| Key / Command | Action |
|---|---|
| `<leader>tt` | Toggle floating scratch terminal (snacks) |
| `:Run <cmd>` | Run any shell command in a floating terminal (e.g., `:Run cmake --build -p debug`) |
| `<Esc>` (in term) | Exit terminal-insert mode |

## Buffers / Tabs (bufferline)

| Key | Action |
|---|---|
| `<S-l>` | Next buffer |
| `<S-h>` | Prev buffer |
| `<leader>bn` | New empty buffer |
| `<leader>bd` | Close current buffer |
| `<leader>bD` | Close all other buffers |
| `<leader>bp` | Pin / unpin current buffer |
| `<leader>fb` | Fuzzy buffer picker (fzf-lua) |

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
| `<leader>uc` | Colorscheme picker (live preview) |

## LSP (buffer-local, on attach)

| Key | Action |
|---|---|
| `gd` | Goto definition (fzf-lua) |
| `gD` | Goto declaration |
| `gi` | Goto implementation (fzf-lua) |
| `gr` | References (fzf-lua) |
| `gp` | Peek definition (lspeek) |
| `gP` | Peek type definition (lspeek) |
| `grn` | Rename (native default) |
| `gra` | Code action (native default) |
| `gri` | Implementation (native default) |
| `gO` | Document symbols (native default) |
| `K` | Hover |
| `<C-s>` | Signature help (insert mode, native default) |
| `<leader>ch` | Clangd: switch source/header |
| `<leader>cf` | Format buffer (clangd, or skipped when pre-commit clang-format owns the project) |
| `<leader>cF` | Run all pre-commit hooks on the current file |
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

## Git (`<leader>g` — lazygit + snacks)

| Key | Action |
|---|---|
| `<leader>gg` | Lazygit (full UI in floating window) |
| `<leader>gl` | Lazygit log (whole repo) |
| `<leader>gf` | Lazygit log (current file) |
| `<leader>go` | Open current line / selection on GitHub (gitbrowse) |
| `:GH <num>` | Open PR/issue number on GitHub (no arg = repo home) |

## Completion (blink.cmp, insert mode)

Default preset: `<Tab>`/`<S-Tab>` navigate, `<CR>` accept, `<C-Space>` trigger, `<C-e>` cancel. See `:h blink-cmp-config-keymap` for the full default map.
