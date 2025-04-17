return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},

	-- Autocompletion
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		cmp.setup({
	-- 			sources = {
	-- 				{ name = "nvim_lsp" },
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
	-- 				["<S-Tab>"] = function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end,
	-- 				["<Tab>"] = function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end,
	-- 				["<C-x>"] = cmp.mapping.complete(),
	-- 			}),
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					vim.snippet.expand(args.body)
	-- 				end,
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "enter" },
			signature = {
				enabled = true,
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = { documentation = { auto_show = false } },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	-- snippets
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
		opts = {
			snippetDir = vim.fn.stdpath("config") .. "/snippets",
		},
		config = function()
			vim.keymap.set("n", "<leader>se", function()
				require("scissors").editSnippet()
			end, { desc = "Snippet: Edit" })

			-- when used in visual mode, prefills the selection as snippet body
			vim.keymap.set({ "n", "x" }, "<leader>sa", function()
				require("scissors").addNewSnippet()
			end, { desc = "Snippet: Add" })
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "saghen/blink.cmp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {},
				svelte = {},
				tailwindcss = {},
			},
		},
		config = function()
			local lspconfig = require("lspconfig").util.default_config

			lspconfig.capabilities =
				vim.tbl_deep_extend("force", lspconfig.capabilities, require("blink.cmp").get_lsp_capabilities())

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local mapOpts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", mapOpts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", mapOpts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", mapOpts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", mapOpts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", mapOpts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", mapOpts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", mapOpts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", mapOpts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", mapOpts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", mapOpts)
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
}
