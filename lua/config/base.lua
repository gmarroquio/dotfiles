vim.g.mapleader = " "

vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.wrap = false
vim.opt.whichwrap = "><s"

vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.equalalways = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 8

vim.o.foldlevel = 99
vim.o.foldcolumn = "0"
--vim.o.foldenable = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
