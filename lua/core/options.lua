local opt = vim.opt
local g = vim.g

g.mapleader = ";"
g.encoding = "utf-8"


opt.fileencoding = "utf-8"

-- behavior
opt.confirm = true

opt.autoread = true

opt.hidden = false

opt.timeoutlen = 800 -- for mapped key sequence

opt.wrap = true -- line wrap
opt.tw = 0
opt.whichwrap = "<,>,[,]" -- go to previous/next line

opt.expandtab = true --replace tab with space
opt.tabstop = 2
opt.softtabstop = 2

opt.shiftround = true
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

-- display
opt.ruler = false --the line and column number of the cursor position
opt.termguicolors = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.number = true
opt.relativenumber = false

opt.cul = true -- cursor line

opt.showmode = false

opt.signcolumn = "yes:1"

opt.splitbelow = true
opt.splitright = true

opt.list = true -- show space
opt.listchars = "tab:> ,trail:·"

opt.title = true

opt.fillchars = { eob = " " } -- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758

-- search
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- function
opt.wildmenu = true -- auto completion on command
g.completeopt = "menu,menuone,noselect,noinsert"

opt.viewoptions = "cursor,folds,slash,unix" -- remember where to recover cursor

opt.mouse = "a"

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = false
-- opt.undodir = "/home/shun/.config/nvim/undodir"

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}
for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

-- other
g.loaded_ruby_provider = 0
