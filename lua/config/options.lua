local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.splitright = true
opt.splitbelow = true

opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 300

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }

opt.foldlevelstart = 99
opt.foldlevel = 99

opt.grepprg = "rg --vimgrep --smart-case"
opt.grepformat = "%f:%l:%c:%m"
