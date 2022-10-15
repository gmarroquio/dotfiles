local status, map = pcall(require, "mapping")
if(not status) then return end

map.nnoremap("gph", ":Gitsigns preview_hunk<CR>", { silent = true })
