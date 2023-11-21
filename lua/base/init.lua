-- if vim.v.hlsearch == 1 then
-- 	local sinfo = vim.fn.searchcount({ maxcount = 0 })
-- 	local search_stat = sinfo.incomplete > 0 and "[?/?]"
-- 		or sinfo.total > 0 and ("[%s/%s]"):format(sinfo.current, sinfo.total)
-- 		or nil
-- 
-- 	if search_stat ~= nil then
-- 		-- add search_stat to statusline/winbar
-- 	end
-- end

vim.g.mapleader = " "

vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.wrap = false
vim.opt.whichwrap = "lh"

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

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require("base.plugins")
vim.g.airline_theme = "gruvbox"
vim.cmd("colorscheme gruvbox")
vim.cmd("hi Normal ctermbg=none guibg=none")

require("base.mappings")
