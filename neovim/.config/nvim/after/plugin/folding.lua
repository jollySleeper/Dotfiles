-- For Code Folding With TreeSitter
local opt = vim.opt;

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
-- vim.cmd 'set nofoldenable'
