return {
	"nvimdev/lspsaga.nvim",
	opts = function()
		vim.keymap.set("n", "ge", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true })
		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "gj", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
		vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
		return {
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
		}
	end,
}
