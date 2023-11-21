require("neodev").setup({})

local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = lsp_zero.preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- lsp.format_on_save({
-- 	format_opts = {
-- 		async = false,
-- 		timeout_ms = 100,
-- 	},
-- 	servers = {
-- 	},
-- })

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.svelte.setup({
	capabilities = lsp_capabilities,
	on_attach = function(_, bufnr)
		lsp_zero.default_keymaps({ buffer = bufnr })
	end,
})

lspconfig.tsserver.setup({
	capabilities = lsp_capabilities,
	on_attach = function(_, bufnr)
		lsp_zero.default_keymaps({ buffer = bufnr })
	end,
})

lspconfig.tailwindcss.setup({
	capabilities = lsp_capabilities,
	on_attach = function(_, bufnr)
		lsp_zero.default_keymaps({ buffer = bufnr })
	end,
})

lsp.setup()

local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<C-x>"] = cmp.mapping.complete(),
	},
})
