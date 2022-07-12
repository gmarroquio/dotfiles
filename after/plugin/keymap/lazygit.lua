local Map = require("nbin.mapping")
local nnoremap = Map.nnoremap

nnoremap("<leader>G", ":LazyGit<CR>", { silent = true })
