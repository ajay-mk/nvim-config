local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitkeep = "screen"

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.backspace = { "indent", "eol", "start" }

opt.undofile = true
opt.undolevels = 10000

opt.updatetime = 250
opt.timeoutlen = 400

opt.completeopt = "menu,menuone,noselect,popup"
opt.autocomplete = true
opt.autocompletedelay = 80
opt.pumheight = 12

opt.showmode = false
opt.laststatus = 3

opt.swapfile = false
opt.backup = false
opt.confirm = true
opt.inccommand = "split"
opt.shortmess:append("c")

if vim.fn.has("nvim-0.12") == 1 then
  opt.winborder = "rounded"
end
