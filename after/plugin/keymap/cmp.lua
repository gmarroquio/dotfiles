local status, Map = pcall(require, 'mapping')
if (not status) then return end
local inoremap = Map.inoremap

--inoremap('<Tab>', ":call pumvisible() ? '<C-n>' : '<Tab>'")
--inoremap('<S-Tab>', ":call pumvisible() ? '<C-p>' : '<S-Tab>'")
