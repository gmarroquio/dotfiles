local status, map = pcall(require, "mapping")
if(not status) then return end

map.nnoremap("gj", vim.diagnostic.goto_next, { silent = true })
map.nnoremap("gk", vim.diagnostic.goto_prev, { silent = true })
map.nnoremap("gp", vim.diagnostic.open_float, { silent = true })
