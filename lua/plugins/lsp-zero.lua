return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(_, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)
	end,
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim", opts = {} }, -- Optional
		{
			"williamboman/mason-lspconfig.nvim",
			opts = function()
				local lsp_zero = require("lsp-zero")
				return {
					handlers = {
						lsp_zero.default_setup,
					},
				}
			end,
		}, -- Optional

		-- Autocompletion
		{
			{
				"hrsh7th/nvim-cmp",
				opts = function()
					local cmp = require("cmp")
					return {
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
					}
				end, -- Required
			},
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
}
