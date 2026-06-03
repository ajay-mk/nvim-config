# Fresh Neovim Config — Design

**Date:** 2026-05-27
**Target:** Neovim 0.12+
**Primary workload:** C++ development

## Goals

1. **No bloat.** Each plugin must earn its place against a stated goal.
2. **Built-ins first.** Prefer Neovim's native APIs (`vim.pack`, `vim.lsp.config`, `vim.lsp.completion`, `vim.snippet`, native diagnostics, native `gc` commenting, native LSP keymaps) over plugins that duplicate them.
3. **Mature deps only.** When an external plugin is necessary, pick the well-established option.
4. **C++ navigation.** Jump to definition/declaration, find references, switch header/source, syntax-aware highlighting, autocomplete.
5. **Fix prior pain points:** keymaps forgotten, random LSP/treesitter errors.

## Non-goals

- Debugger (deferred — can add `nvim-dap` later if needed)
- Multi-language IDE setup (Lua/Bash configured for editing this config; everything else opportunistic)
- A plugin per minor convenience

## Architecture

Flat layout under `lua/config/`, each module owns one concern. `init.lua` is a thin loader. No `lua/plugins/` directory; plugin acquisition is centralized in `pack.lua`.

```
~/.config/nvim/
├── init.lua                      # bootstrap: loads config modules in order
├── nvim-pack-lock.json           # version-pinned plugins (managed by vim.pack)
├── KEYBINDINGS.md                # human-facing keymap reference
└── lua/config/
    ├── options.lua               # vim.opt settings
    ├── pack.lua                  # vim.pack.add({...}) — all plugin URLs/pins
    ├── ui.lua                    # colorscheme + lualine setup
    ├── keymaps.lua               # global keymaps (non-plugin)
    ├── which-key.lua             # which-key spec + group labels
    ├── treesitter.lua            # parsers, folds, highlight
    ├── lsp.lua                   # vim.lsp.config('clangd', ...) + LSP keymaps + completion
    ├── completion.lua            # blink.cmp config
    ├── search.lua                # fzf-lua config + keymaps
    ├── git.lua                   # gitsigns + fugitive config/keymaps
    └── autocmds.lua              # format-on-save, close-with-q, etc.
```

Load order in `init.lua`:
1. `options` (must be early — affects later behavior)
2. `pack` (acquire plugins before any config that uses them)
3. `ui`, `treesitter`, `lsp`, `completion`, `search`, `git`
4. `keymaps`, `which-key` (after plugin modules so keymaps can reference plugin commands)
5. `autocmds`

## Plugin Set

| Plugin | Repo | Role |
|---|---|---|
| `nvim-treesitter` | `nvim-treesitter/nvim-treesitter` (**main** branch) | Syntax, folds, indent |
| `which-key.nvim` | `folke/which-key.nvim` | Keymap discoverability |
| `fzf-lua` | `ibhagwan/fzf-lua` | Fuzzy: files, grep, LSP refs/symbols, header switch |
| `blink.cmp` | `saghen/blink.cmp` | Completion |
| `gitsigns.nvim` | `lewis6991/gitsigns.nvim` | Gutter signs, hunk staging, blame line |
| `vim-fugitive` | `tpope/vim-fugitive` | Full git workflow (`:Git`, `:Gdiffsplit`, `:Gread`, log) |
| `lualine.nvim` | `nvim-lualine/lualine.nvim` | Statusline |
| `darcula.nvim` | `doums/darcula` (or equivalent) | Colorscheme |

**Manager:** `vim.pack` (built-in). All plugins added via a single `vim.pack.add({...})` call in `pack.lua`; versions pinned in `nvim-pack-lock.json`.

**Not included** (intentionally): `mason`, `nvim-lspconfig`, `nvim-cmp`, `LuaSnip`, `telescope`, `neo-tree`, `bufferline`, `toggleterm`, `cmake-tools`, `nvim-dap`, comment plugin.

## External Binaries

Already present on this machine; no installs required:

| Binary | Version | Provided by |
|---|---|---|
| `clangd` | 17.0.0 | Apple Xcode CLT (`/usr/bin/clangd`) |
| `fzf` | 0.73.1 | Homebrew |
| `ripgrep` | 15.1.0 | Homebrew |
| `git` | 2.54.0 | Homebrew |
| `nvim` | 0.12.2 | Homebrew |

If clangd ever lags behind needs (newer C++ standard support, newer features), upgrade via `brew install llvm` and point `vim.lsp.config('clangd', { cmd = {...} })` at the brew binary.

## Module Specifications

### `options.lua`
Standard editor options: numbers, relativenumber, signcolumn=yes, expandtab, shiftwidth=2 (override per filetype later), termguicolors, undofile, splitright/splitbelow, mouse=a, clipboard=unnamedplus, scrolloff=8. Tweak as you go.

### `pack.lua`
Single `vim.pack.add` call listing all plugin specs. Each entry includes `src` and `version` (commit/tag). Lock file committed to repo.

### `ui.lua`
- `vim.cmd.colorscheme('darcula')` (after pack has loaded it)
- `require('lualine').setup({...})` with a minimal section layout: mode, branch, filename, diagnostics, filetype, position. No fancy extensions initially.

### `treesitter.lua`
- Use **main branch** API (not master). This avoids the most common source of treesitter errors.
- Explicit parser list: `c, cpp, lua, vim, vimdoc, query, markdown, bash, json, yaml`.
- Enable highlight, indent, fold (via `foldexpr = vim.treesitter.foldexpr()`).
- No external `nvim-treesitter-textobjects` — defer until a concrete need.

### `lsp.lua`
- `vim.lsp.config('clangd', { cmd = {'clangd', '--background-index', '--clang-tidy', '--header-insertion=iwyu'}, ... })`
- `vim.lsp.enable('clangd')` — autostarts on C/C++ buffers.
- On `LspAttach` autocmd, enable inlay hints via `vim.lsp.inlay_hint.enable(true, { bufnr })`. Do **not** call `vim.lsp.completion.enable` — blink.cmp owns completion.
- Keymaps in addition to Neovim 0.11+ defaults (`grn`/`gra`/`grr`/`gri`/`gO`/`K`/`<C-s>`):
  - `gd` — definition (override default to use fzf-lua picker for multi-result)
  - `gD` — declaration
  - `<leader>ch` — clangd `switchSourceHeader`
  - `<leader>ti` — toggle inlay hints
  - `<leader>cf` — `vim.lsp.buf.format()`

### `completion.lua`
- `blink.cmp` with defaults; sources: LSP, path, buffer, snippets (`vim.snippet`).
- Tab/Shift-Tab navigation, `<CR>` accept, `<C-Space>` trigger.

### `search.lua`
fzf-lua setup + keymaps (under `<leader>f`):
- `<leader>ff` — files
- `<leader>fg` — live grep
- `<leader>fb` — buffers
- `<leader>fh` — help
- `<leader>fs` — LSP document symbols
- `<leader>fS` — LSP workspace symbols
- `<leader>fr` — LSP references
- `<leader>fd` — diagnostics

### `git.lua`
- `gitsigns` defaults + keymaps under `<leader>h` (hunks): `hs` stage, `hr` reset, `hp` preview, `hb` blame line, `]c`/`[c` next/prev hunk.
- `vim-fugitive` keymaps under `<leader>g`: `gs` `:Git` status, `gc` `:Git commit`, `gd` `:Gdiffsplit`, `gl` `:Git log`, `gb` `:Git blame`, `gP` `:Git push`, `gp` `:Git pull`.

### `which-key.lua`
- `require('which-key').setup({})` + group labels for every `<leader>` prefix (`f`=Find, `g`=Git, `h`=Hunk, `c`=Code, `t`=Toggle).
- Delay set short (~300ms).

### `keymaps.lua`
Non-plugin global keymaps only:
- `<leader>` = space
- Window navigation: `<C-h/j/k/l>` (works in normal + terminal mode)
- `<Esc>` clears search highlight
- `<leader>w` write, `<leader>q` quit
- Center cursor on `<C-d>`/`<C-u>`/`n`/`N`

### `autocmds.lua`
- Highlight on yank
- Close-with-`q` for help/qf/man/lspinfo filetypes
- Format-on-save for C/C++ if LSP attached (guarded with `vim.lsp.get_clients`)
- Restore last cursor position

## Keymap Reference (KEYBINDINGS.md)

Regenerate `KEYBINDINGS.md` to match the new bindings. Group by leader-prefix matching which-key labels.

## How This Addresses Prior Pain

| Prior pain | Fix |
|---|---|
| Couldn't remember keymaps | which-key shows every leader-prefix menu; KEYBINDINGS.md as printable reference |
| Random LSP errors | No mason → no version drift, no parallel binary dir. `vim.lsp.config` is the stable native API. System clangd. |
| Random treesitter errors | Pin nvim-treesitter to **main** branch (not master). Explicit parser list. Versions in nvim-pack-lock.json. |
| Plugin sprawl | 8 plugins total. Each maps to a goal. mason/cmp/telescope/dap/cmake-tools all dropped. |

## Implementation Order

Implementation plan will be drafted separately by writing-plans. Rough sequencing for awareness:

1. Wipe existing `lua/` and `init.lua`; commit empty starting point.
2. `options.lua` + minimal `init.lua` loader. Verify `nvim` opens cleanly.
3. `pack.lua` with colorscheme only. Verify plugin acquisition works end-to-end.
4. `ui.lua` (colorscheme + lualine).
5. `treesitter.lua`.
6. `lsp.lua` with clangd. Verify on a real C++ file: hover, goto-def, diagnostics.
7. `completion.lua` (blink.cmp).
8. `search.lua` (fzf-lua).
9. `git.lua` (gitsigns + fugitive).
10. `keymaps.lua` + `which-key.lua`.
11. `autocmds.lua`.
12. Rewrite `KEYBINDINGS.md`.

Each step ends with `nvim` opening cleanly and the new capability verified manually.

## Risks / Open Questions

- **blink.cmp maturity:** newer than nvim-cmp. Pin to a known-good commit; revisit if instability shows up.
- **darcula plugin source:** confirm a maintained repo at pack time. Fallback: any built-in/dark theme.
- **fugitive long-term maintenance:** Tim Pope has slowed; plugin still stable. Acceptable risk; alternatives (neogit) require plenary.
- **nvim-treesitter main branch API:** still evolving in 2026. Pin commit and don't auto-update without testing.
