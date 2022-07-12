local Map = require("nbin.mapping")
local inoremap = Map.inoremap
local nnoremap = Map.nnoremap
local vnoremap = Map.vnoremap
local tnoremap = Map.tnoremap
local map = Map.map

inoremap("<C-s>", "<C-o>:w<CR><Esc>")
nnoremap("<C-s>", ":w<CR>")
nnoremap("<leader>v", ":source ~/.config/nvim/init.vim<CR>")
nnoremap(",i", "i_<Esc>r")
vnoremap("J", ":move '>+1<CR>gv-gv")
vnoremap("K", ":move '<lt>-2<CR>gv-gv")
nnoremap("<leader>q", ":q!<CR>", { silent = true })
nnoremap("<leader>Nh", ":noh<CR>", { silent = true })
nnoremap("<leader>Nc", ":e ~/.config/nvim/init.lua<CR>", { silent = true })
vnoremap("<leader>y", '"*y', { silent = true})
vnoremap("<leader>p", '"*p', { silent = true})

-- tmux 
nnoremap("<leader>t", ":!tmux source ~/.tmux.conf<CR>")
-- tmux end

-- Highlight syntax
--autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
--autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
-- Highlight syntax end

-- Toggleterm
-- Toggleterm end

-- Resize window
nnoremap("<A-->", "<C-w>-")
nnoremap("<A-=>", "<C-w>+")
nnoremap("<A-.>", "<C-w>>")
nnoremap("<A-,>", "<C-w><")
-- Resize window end

-- Remap end
