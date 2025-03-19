return {
	"nvimdev/lspsaga.nvim",
	keys = {
		{
			"ge",
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
		},
		{ "K", "<Cmd>Lspsaga hover_doc<CR>" },
		{ "gj", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
		{ "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>" },
		{ "gd", "<Cmd>Lspsaga goto_definition<CR>" },
		{ "gt", "<Cmd>Lspsaga goto_type_definition<CR>" },
		{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", mode = "i" },
		{ "gp", "<Cmd>Lspsaga peek_definition<CR>" },
		{ "gr", "<Cmd>Lspsaga rename<CR>" },
	},
	opts = {
		outline = {
			layout = "float",
		},
		diagnostic = {
			max_height = 0.8,
			max_width = 0.8,
			max_show_width = 0.7,
			keys = {
				quit = { "q", "<ESC>" },
			},
		},
		symbol_in_winbar = {
			enable = false,
		},
		ui = {
			border = "rounded",
			colors = {
				-- normal_bg = "#002b36",
			},
		},
		max_width = 0.8,
		beacon = {
			enable = false,
		},
		lightbulb = {
			enable = false,
		},
	},
}
