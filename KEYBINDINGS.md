# Neovim Keybindings Reference

**Leader Key: `<Space>`**

## General

| Keybinding | Action |
|------------|--------|
| `<Esc>` | Clear search highlights |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>e` | Show diagnostic float |
| `<leader>n` | Toggle file explorer (Neo-tree) |
| `<leader>o` | Focus file explorer |

## Bufferline

| Keybinding | Action |
|------------|--------|
| `<leader>bp` | Pin buffer |
| `<leader>bP` | Close unpinned buffers |

## Terminal

| Keybinding | Action |
|------------|--------|
| `<C-\>` | Toggle floating terminal |
| `<leader>tf` | Floating terminal |
| `<leader>th` | Horizontal terminal (bottom) |
| `<leader>tv` | Vertical terminal (side) |

**Inside terminal:**

| Keybinding | Action |
|------------|--------|
| `<C-\>` | Close terminal |
| `<Esc><Esc>` | Exit terminal mode |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |

## Window Navigation

| Keybinding | Action |
|------------|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

## Buffer Navigation

| Keybinding | Action |
|------------|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<leader>bd` | Delete buffer |

## Editing

| Keybinding | Mode | Action |
|------------|------|--------|
| `<` | Visual | Indent left (stay in visual) |
| `>` | Visual | Indent right (stay in visual) |
| `J` | Visual | Move line down |
| `K` | Visual | Move line up |
| `<C-d>` | Normal | Scroll down (centered) |
| `<C-u>` | Normal | Scroll up (centered) |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |

## LSP

| Keybinding | Mode | Action |
|------------|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Show references |
| `K` | Normal | Hover documentation |
| `<C-k>` | Insert | Signature help |
| `<leader>la` | Normal | Code action |
| `<leader>lr` | Normal | Rename symbol |
| `<leader>lf` | Normal | Format buffer |
| `<leader>li` | Normal | Toggle inlay hints |
| `<leader>ls` | Normal | Switch source/header (clangd) |
| `<leader>D` | Normal | Type definition |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

## Telescope (Fuzzy Finder)

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |
| `<leader>fd` | Diagnostics |
| `<leader>fc` | Git commits |
| `<leader>fk` | Keymaps |

**Inside Telescope:**
| Keybinding | Action |
|------------|--------|
| `<C-j>` | Move selection down |
| `<C-k>` | Move selection up |

## Debugging (DAP)

| Keybinding | Action |
|------------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last |
| `<leader>dt` | Terminate |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Eval (normal/visual) |

## CMake

| Keybinding | Action |
|------------|--------|
| `<leader>cg` | CMake generate |
| `<leader>cb` | CMake build |
| `<leader>cr` | CMake run |
| `<leader>cd` | CMake debug |
| `<leader>ct` | Select build type |
| `<leader>cs` | Select build target |
| `<leader>cl` | Select launch target |
| `<leader>cc` | CMake clean |

## Git (Neogit)

| Keybinding | Action |
|------------|--------|
| `<leader>gg` | Neogit (Git GUI) |
| `<leader>gc` | Git commit |
| `<leader>gp` | Git push |
| `<leader>gP` | Git pull |
| `<leader>gl` | Git log |
| `<leader>gb` | Git branch |

## Diffview

| Keybinding | Action |
|------------|--------|
| `<leader>gd` | Git diff view |
| `<leader>gD` | Diff vs last commit |
| `<leader>gh` | File history |
| `<leader>gH` | Branch history |
| `<leader>gq` | Close diff view |

## Git Hunks (Gitsigns)

| Keybinding | Mode | Action |
|------------|------|--------|
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hR` | Normal | Reset buffer |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hS` | Normal | Stage buffer |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hb` | Normal | Blame line (full) |
| `<leader>hd` | Normal | Diff this |

## Treesitter

| Keybinding | Action |
|------------|--------|
| `<C-space>` | Start/expand selection |
| `<BS>` | Shrink selection |

## Autocompletion (Insert Mode)

| Keybinding | Action |
|------------|--------|
| `<Tab>` | Next completion item / Expand snippet |
| `<S-Tab>` | Previous completion item / Jump back in snippet |
| `<CR>` | Confirm completion |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |

## Commands

| Command | Action |
|---------|--------|
| `:Mason` | Open Mason UI (install/manage LSP servers, formatters) |
| `:MasonInstall <pkg>` | Install a package (e.g., `:MasonInstall clangd`) |
| `:MasonUpdate` | Update all Mason packages |
| `:Lazy` | Open Lazy plugin manager UI |
| `:LazySync` | Sync plugins (install, update, clean) |
| `:checkhealth` | Check Neovim health and plugin status |
