local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()
--
-- require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_snipmate").lazy_load() -- Lazy loading
-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
-- require("luasnip").filetype_extend("javascript", { "html" })

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
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
	}),

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
