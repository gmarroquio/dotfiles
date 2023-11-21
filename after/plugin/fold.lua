require("pretty-fold").setup({})

require("fold-preview").setup({})

require("ufo").setup({
	provider_selector = function()
		return { "treesitter", "indent" }
	end,
})
