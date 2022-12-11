vim.opt.clipboard:append({ 'unnamedplus' })

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.mouse = "a"
vim.opt.equalalways = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.g.mapleader = " "
vim.g.airline_theme = "gruvbox"
vim.cmd("colorscheme gruvbox")
vim.cmd("hi Normal ctermbg=none guibg=none")
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.hlsearch = false
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

local rememberId = vim.api.nvim_create_augroup("remember_folds", {clear = true})

vim.api.nvim_create_autocmd('BufWinLeave', {
  command = "mkview",
  pattern = "*.*",
  group = rememberId
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  command = "loadview",
  pattern = "*.*",
  group = rememberId
})

vim.api.nvim_create_autocmd({"FileType"}, {pattern = {"*.json"}, command = "syntax match Comment +\\/\\/.\\+$+"})

--local removeNetrwHidden = vim.api.nvim_create_augroup("remove_netrw", {clear = true})
-- 
--vim.api.nvim_create_autocmd({"FileType", "netrw"}, {
--   command = "setloacl bufhidden=wipe",
--   group = removeNetrwHidden
--})
