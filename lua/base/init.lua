vim.opt.clipboard:append({ 'unnamedplus' })

vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
--vim.opt.signcolumn = "number"
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
--vim.opt.mouse = "a"
--vim.opt.equalalways = false
vim.opt.ignorecase = true
--vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
--vim.opt.cursorline = true
vim.opt.hlsearch = false

vim.g.airline_theme = "gruvbox"
vim.cmd("colorscheme gruvbox")
vim.cmd("hi Normal ctermbg=none guibg=none")

require("base.mappings")
require("base.plugins")
