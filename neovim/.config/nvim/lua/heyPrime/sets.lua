-- All the SETS
local opt = vim.opt;

-- Numbers
opt.nu = true
opt.relativenumber = true

-- Tabs & Indents
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Wrap Line
opt.wrap = false

-- For UndoTree as Backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = false
opt.incsearch = true

-- Colors
opt.termguicolors = true
opt.colorcolumn = "100"

-- Basic
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Update Time
opt.updatetime = 50

-- Leader
vim.g.mapleader = " ";
