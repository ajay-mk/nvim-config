# Neovim Keybindings Reference

Leader key: `<Space>`

## General

| Keybinding | Action |
| --- | --- |
| `<Esc>` | Clear search highlights |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all |
| `<leader>e` | Show diagnostic under cursor |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

## Window Navigation

| Keybinding | Action |
| --- | --- |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

## Buffers

| Keybinding | Action |
| --- | --- |
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<leader>bd` | Delete buffer |

## Editing

| Keybinding | Mode | Action |
| --- | --- | --- |
| `<` | Visual | Indent left and stay selected |
| `>` | Visual | Indent right and stay selected |
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |
| `<C-d>` | Normal | Scroll down and center |
| `<C-u>` | Normal | Scroll up and center |
| `n` | Normal | Next search result and center |
| `N` | Normal | Previous search result and center |

## Project Tree

| Keybinding | Action |
| --- | --- |
| `<leader>n` | Toggle project tree |
| `<leader>o` | Focus project tree |

## Search

| Keybinding | Action |
| --- | --- |
| `<leader><leader>` | Search files |
| `<C-p>` | Search files |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |
| `<leader>fw` | Search word under cursor |
| `<leader>fd` | Diagnostics |
| `<leader>fc` | Git commits |
| `<leader>fk` | Keymaps |

## LSP

| Keybinding | Mode | Action |
| --- | --- | --- |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | List references |
| `K` | Normal | Hover documentation |
| `<C-k>` | Insert | Signature help |
| `<C-Space>` | Insert | Trigger completion |
| `<leader>la` | Normal | Code action |
| `<leader>lr` | Normal | Rename symbol |
| `<leader>lf` | Normal | Format buffer |
| `<leader>li` | Normal | Toggle inlay hints |
| `<leader>ls` | Normal | Switch source/header |
| `<leader>lm` | Normal | Open Mason |

## CMake

| Keybinding | Action |
| --- | --- |
| `<leader>cg` | CMake generate |
| `<leader>cb` | CMake build |
| `<leader>cB` | Build current file target |
| `<leader>cr` | Run selected target |
| `<leader>cR` | Run current file target |
| `<leader>cd` | Debug selected target |
| `<leader>cD` | Debug current file target |
| `<leader>ct` | Select build type |
| `<leader>cp` | Select configure preset |
| `<leader>cP` | Select build preset |
| `<leader>cs` | Select build target |
| `<leader>cl` | Select launch target |
| `<leader>ca` | Set launch args |
| `<leader>cT` | Select test preset |
| `<leader>cx` | Run CTest |
| `<leader>ce` | Open CMake executor |
| `<leader>cv` | Open CMake runner |
| `<leader>cX` | Stop CMake runner |
| `<leader>cc` | CMake clean |

## Debugging

| Keybinding | Action |
| --- | --- |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Open REPL |
| `<leader>dt` | Terminate |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Eval expression |

## Terminal

| Keybinding | Action |
| --- | --- |
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Floating terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |

Inside terminal:

| Keybinding | Action |
| --- | --- |
| `<Esc><Esc>` | Exit terminal mode |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |

## Git

| Keybinding | Action |
| --- | --- |
| `<leader>gg` | Open Neogit |
| `<leader>gc` | Git commit |
| `<leader>gp` | Git push |
| `<leader>gP` | Git pull |
| `<leader>gl` | Git log |
| `<leader>gb` | Git branches |
| `<leader>gd` | Open diff view |
| `<leader>gq` | Close diff view |
| `<leader>gh` | File history |
| `<leader>gH` | Project history |

## Git Hunks

| Keybinding | Mode | Action |
| --- | --- | --- |
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line |
| `<leader>hd` | Normal | Diff this |
