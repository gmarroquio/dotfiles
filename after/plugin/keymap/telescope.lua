local Map = require("mapping")
local inoremap = Map.inoremap
local nnoremap = Map.nnoremap
local vnoremap = Map.vnoremap
local tnoremap = Map.tnoremap
local map = Map.map

nnoremap("<leader>f", ":Telescope find_files<cr>")
nnoremap("<leader>g", ":Telescope live_grep<cr>")
nnoremap("<leader>b", ":Telescope buffers<cr>")
nnoremap("<leader>h", ":Telescope help_tags<cr>")
nnoremap("<leader>p", ":Telescope projects<cr>")
