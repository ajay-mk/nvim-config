# Neovim config

Personal Neovim configuration oriented toward C++ development, using the built-in `vim.pack` package manager (requires Neovim 0.11+).

## Setup

```sh
git clone <repo> ~/.config/nvim
nvim
```

Packages are loaded automatically on startup via `vim.pack.add`. No separate install step needed.

## Structure

```
init.lua          # entry point, loads all modules
lua/config/
  options.lua     # vim options
  pack.lua        # plugin declarations
  ui.lua          # colorscheme, statusline, bufferline, dashboard
  treesitter.lua  # syntax highlighting
  lsp.lua         # LSP config (clangd, lua_ls)
  completion.lua  # blink.cmp
  search.lua      # fzf-lua
  files.lua       # nvim-tree
  git.lua         # gitsigns, lazygit
  cmake.lua       # cmake-tools
  keymaps.lua     # keybindings
  which-key.lua   # keymap hints
  precommit.lua   # pre-commit integration
  autocmds.lua    # autocommands
  start.lua       # snacks dashboard
```

## Dependencies

External tools expected on `$PATH`:

- `clangd` — C/C++ LSP
- `lua-language-server` — Lua LSP
- `fzf` — fuzzy finder backend
- `lazygit` — git UI (optional)
- `pre-commit` — if using the pre-commit integration

See [KEYBINDINGS.md](KEYBINDINGS.md) for the keymap reference.

## Misc

- **Auto clang-format on save**: if the project has a `.pre-commit-config.yaml` with a `clang-format` hook, saving any C/C++ file automatically runs `pre-commit run clang-format` on it in the background.
