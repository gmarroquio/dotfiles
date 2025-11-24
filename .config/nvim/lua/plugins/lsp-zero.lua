return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
				["<C-x>"] = {
					function(cmp)
						cmp.show()
					end,
				},
			},
			signature = {
				enabled = true,
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true },
				menu = {
					draw = {
						components = {
							label = {
								text = function(ctx)
									local label = ctx.item.label
									if ctx.item.detail then
										label = label .. " " .. ctx.item.detail
									end
									return label
								end,
							},
						},
					},
				},
			},

			sources = {
				default = { "lsp", "buffer", "path", "snippets" },
				providers = {
					snippets = {
						score_offset = 9,
					},
					lsp = {
						score_offset = 10,
					},
					path = {
						score_offset = 9,
					},
					buffer = {
						score_offset = 8,
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	-- snippets
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = vim.fn.stdpath("config") .. "/snippets",
		},
		config = function()
			vim.keymap.set("n", "<leader>se", function()
				require("scissors").editSnippet()
			end, { desc = "Snippet: Edit" })

			vim.keymap.set({ "n", "x" }, "<leader>sa", function()
				require("scissors").addNewSnippet()
			end, { desc = "Snippet: Add" })
		end,
	},

	-- LSP
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"neovim/nvim-lspconfig",
				config = function()
					local lspconfig = require("lspconfig").util.default_config

					lspconfig.capabilities = vim.tbl_deep_extend(
						"force",
						lspconfig.capabilities,
						require("blink.cmp").get_lsp_capabilities()
					)

					vim.api.nvim_create_autocmd("LspAttach", {
						desc = "LSP actions",
						callback = function(event)
							local mapOpts = { buffer = event.buf }

							vim.keymap.set("n", "K", vim.lsp.buf.hover, mapOpts)
							vim.keymap.set("n", "gd", vim.lsp.buf.definition, mapOpts)
							vim.keymap.set("n", "gD", vim.lsp.buf.declaration, mapOpts)
							vim.keymap.set("n", "gi", vim.lsp.buf.implementation, mapOpts)
							vim.keymap.set("n", "go", vim.lsp.buf.type_definition, mapOpts)
							vim.keymap.set("n", "gr", vim.lsp.buf.references, mapOpts)
							vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, mapOpts)
							vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, mapOpts)
							vim.keymap.set({ "n", "x" }, "<F3>", function()
								vim.lsp.buf.format({ async = true })
							end, mapOpts)
							vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, mapOpts)
						end,
					})

					require("mason-lspconfig").setup({
						ensure_installed = {},
						handlers = {
							-- this first function is the "default handler"
							-- it applies to every language server without a "custom handler"
							function(server_name)
								require("lspconfig")[server_name].setup({})
							end,
						},
					})
				end,
			},
		},
	},
}
