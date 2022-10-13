local Map = require("mapping")

Map.nnoremap("<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op()<CR>", { silent = true })
Map.vnoremap("<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", { silent = true })
