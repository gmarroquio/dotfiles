local status, map = pcall(require, "core.mapping")
if not status then
	return
end

local lsp_status, lsp = pcall(require, "lspconfig")
if not lsp_status then
	return
end

local function format(opts)
	if vim.lsp.buf.format then
		return vim.lsp.buf.format(opts)
	end

	local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
	local clients = vim.lsp.buf_get_clients(bufnr)
	if opts.filter then
		clients = opts.filter(clients)
	elseif opts.id then
		clients = vim.tbl_filter(function(client)
			return client.id == opts.id
		end, clients)
	elseif opts.name then
		clients = vim.tbl_filter(function(client)
			return client.name == opts.name
		end, clients)
	end
	clients = vim.tbl_filter(function(client)
		return client.supports_method("textDocument/formatting")
	end, clients)
	if #clients == 0 then
		vim.notify_once("[LSP] Format request failed, no matching language servers.")
	end
	local timeout_ms = opts.timeout_ms or 1000
	for _, client in pairs(clients) do
		local params = vim.lsp.util.make_formatting_params(opts.formatting_options)
		local result, err = client.request_sync("textDocument/formatting", params, timeout_ms, bufnr)
		if result and result.result then
			vim.lsp.util.apply_text_edits(result.result, bufnr, client.offset_encoding)
		elseif err then
			vim.notify(string.format("[LSP][%s] %s", client.name, err), vim.log.levels.WARN)
		end
	end
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				format({ name = "null-ls", bufnr = bufnr })
			end,
		})
	end

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
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
	capabilities = capabilities,
})

lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

lsp.tailwindcss.setup({})
