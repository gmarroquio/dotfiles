local status, map = pcall(require, "mapping")
if(not status) then return end

local opts = { silent = true }

map.nnoremap("gj", vim.diagnostic.goto_next, opts)
map.nnoremap("gk", vim.diagnostic.goto_prev, opts)
map.nnoremap("<leader>d", "<cmd>Telescope diagnostics<CR>", opts)
map.nnoremap("ge", vim.diagnostic.open_float, opts)
map.nnoremap("gi", "<cmd>Telescope lsp_implementation<CR>", opts)
map.nnoremap("gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map.nnoremap("gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
map.nnoremap("gr", "<cmd>Telescope lsp_references<CR>", opts)
map.nnoremap("<leader>a", vim.lsp.buf.code_action, opts)
map.nnoremap("<leader>rn", vim.lsp.buf.rename, opts)
map.nnoremap("K", vim.lsp.buf.hover, opts)
-- map.nnoremap("<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
-- map.nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
