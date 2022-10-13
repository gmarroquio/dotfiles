local Map = require("mapping")
local inoremap = Map.inoremap
local nnoremap = Map.nnoremap
local vnoremap = Map.vnoremap

inoremap("<C-s>", "<Esc>:w<CR>")
vnoremap("<C-s>", "<Esc>:w<CR>")
nnoremap("<C-s>", ":w<CR>")
nnoremap("<leader>i", "i_<Esc>r")
vnoremap("J", ":move '>+1<CR>gv-gv", { silent = true })
vnoremap("K", ":move '<lt>-2<CR>gv-gv", { silent = true })
nnoremap("<leader>q", ":q!<CR>", { silent = true })
nnoremap("<leader>Nh", ":noh<CR>", { silent = true })
nnoremap("<leader>Nc", ":e ~/.config/nvim/init.lua<CR>", { silent = true })
nnoremap("<leader>s", ":PackerSync<CR>")
vnoremap("<leader>y", '"*y', { silent = true })
vnoremap("<leader>p", '"*p', { silent = true })
-- tmux 
nnoremap("<leader>x", ":!tmux source ~/.tmux.conf<CR>")
-- tmux end

-- Highlight syntax
--autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
--autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
-- Highlight syntax end

-- Window
nnoremap("<A-->", "<C-w>-") -- decrease windown height
nnoremap("<A-=>", "<C-w>+") -- increase windown height
nnoremap("<A-.>", "<C-w>>") -- expand window to right
nnoremap("<A-,>", "<C-w><") -- expand window to left
nnoremap("ss", ":split<CR><C-w>w") -- open a split window
nnoremap("sv", ":vsplit<CR><C-w>w") -- open a vertical split window
-- Window end

-- Tab
nnoremap("te", ":tabedit<CR>", { silent = true }) -- open new tab
-- Tab end
