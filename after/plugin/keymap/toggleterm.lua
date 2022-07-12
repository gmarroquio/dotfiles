local Map = require("nbin.mapping")
local nnoremap = Map.nnoremap
local tnoremap = Map.tnoremap

nnoremap("<C-t>", ":ToggleTerm<CR>", { silent = true })
tnoremap("<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { silent = true })
--nnoremap <silent><leader>f :ToggleTerm direction=float<CR>
--tnoremap <silent><leader>f <C-\><C-n>:ToggleTerm<CR>
