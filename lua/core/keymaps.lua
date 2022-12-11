local Map = require("core.mapping")
local inoremap = Map.inoremap
local nnoremap = Map.nnoremap
local vnoremap = Map.vnoremap

local opt = { silent = true }

vnoremap("p", '<Nop>', opt)
inoremap("<C-s>", "<Esc>:w<CR>")
vnoremap("<C-s>", "<Esc>:w<CR>")
nnoremap("<C-s>", ":w<CR>")
nnoremap("<leader>i", "i_<Esc>r")
vnoremap("J", ":move '>+1<CR>gv-gv", opt)
vnoremap("K", ":move '<lt>-2<CR>gv-gv", opt)
nnoremap("<leader>q", ":q!<CR>", opt)
nnoremap("<leader>Nh", ":noh<CR>", opt)
nnoremap("<leader>Nc", ":e ~/.config/nvim/init.lua<CR>", opt)
nnoremap("<leader>s", ":PackerSync<CR>")
vnoremap("p", '"_dP', opt)

-- netrw
-- nnoremap("<leader>e", ":Lexplore<CR>", opt)
-- netrw end

-- tmux
nnoremap("<leader>x", ":!tmux source ~/.tmux.conf<CR>")
-- tmux end

-- Window
nnoremap("<A-->", "<C-w>-", opt) -- decrease windown height
nnoremap("<A-=>", "<C-w>+", opt) -- increase windown height
nnoremap("<A-.>", "<C-w>>", opt) -- expand window to right
nnoremap("<A-,>", "<C-w><", opt) -- expand window to left
nnoremap("ss", ":split<CR><C-w>w", opt) -- open a split window
nnoremap("sv", ":vsplit<CR><C-w>w", opt) -- open a vertical split window
-- Window end

-- Tab
nnoremap("te", ":tabedit<CR>", opt) -- open new tab
nnoremap("<leader>.", ":tabNext<CR>", opt) -- open new tab
nnoremap("<leader>,", ":tabprevious:tabclose<CR><CR>", opt) -- open new tab
nnoremap("<leader>c", ":tabclose<CR>", opt)
-- Tab end

-- Buffers
-- Buffers
