local Map = require("mapping")
local nnoremap = Map.nnoremap

nnoremap("<leader>f", ":Telescope find_files<cr>")
nnoremap("<leader>g", ":Telescope live_grep<cr>")
nnoremap("<leader>b", ":Telescope buffers<cr>")
nnoremap("<leader>h", ":Telescope help_tags<cr>")
nnoremap("<leader>p", ":Telescope projects<cr>")
nnoremap("<leader><C-a>", require("harpoon.ui").toggle_quick_menu)

