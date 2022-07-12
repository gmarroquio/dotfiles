vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.equalalways = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.g.mapleader = " "
vim.g.airline_theme = "gruvbox"
vim.cmd("colorscheme gruvbox")
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.api.nvim_create_autocmd({"FileType"}, {pattern = {"*.json"}, command = "syntax match Comment +\\/\\/.\\+$+"})
vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, command = "hi Normal ctermbg=none guibg=none"})
vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, command = "hi SignColumn ctermbg=none guibg=none"})
vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, command = "hi NormalNC ctermbg=none guibg=none"})
vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, command = "hi MsgArea ctermbg=none guibg=none"})
vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, command = "hi TelescopeBorder ctermbg=none guibg=none"})
vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, command = "hi NvimTreeNormal ctermbg=none guibg=none"})

--"au ColorScheme * hi Normal ctermbg=none guibg=none"
--"au ColorScheme * hi SignColumn ctermbg=none guibg=none"
--"au ColorScheme * hi NormalNC ctermbg=none guibg=none"
--"au ColorScheme * hi MsgArea ctermbg=none guibg=none"
--"au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
--"au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
--"let &fcs='eob: '"

-- Add jsonc syntax
--autocmd FileType json syntax match Comment +\/\/.\+$+
--

--let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
--let g:loaded_matchparen = 1
--let g:colorizer_auto_color = 1
--
