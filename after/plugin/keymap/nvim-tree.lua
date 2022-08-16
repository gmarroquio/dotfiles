local Map = require("mapping")
local nnoremap = Map.nnoremap

nnoremap("<leader>e", ":NvimTreeToggle<CR>", { silent = true })
nnoremap("<leader>r", ":NvimTreeRefresh<CR>", { silent = true })
nnoremap("<leader>n", ":NvimTreeFindFile<CR>", { silent = true })
