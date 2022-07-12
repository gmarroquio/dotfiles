local M = require("nbin.mapping")

M.inoremap("<C-x>", "coc#refresh()", {silent = true, expr = true})
M.inoremap("<Cr>", "complete_info(['selected'])['selected'] != -1 ? '<C-y>' : '<C-g>u<CR>'", {silent = true, expr = true})
M.inoremap("<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", {expr = true})
M.inoremap("<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", {expr = true})
M.nnoremap("gd", ":call CocAction('jumpImplementation')<Cr>", {silent = true})
M.nnoremap("gy", ":call CocAction('jumpTypeDefinition')<Cr>", {silent = true})
M.nnoremap("<S-K>", ":call CocAction('doHover', v:false)<CR>", {silent = true})
