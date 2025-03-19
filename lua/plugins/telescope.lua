return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ path_display = { "truncate" } })
			end,
		},
		{
			"<leader>bi",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") })
			end,
		},
		{
			"<leader>fi",
			function()
				require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
			end,
		},
		{ "<leader>fg", require("telescope.builtin").live_grep },
		{ "<leader>fb", require("telescope.builtin").buffers },
		{ "<leader>fh", require("telescope.builtin").help_tags },
		{ "<leader>fr", require("telescope.builtin").resume },
		{ "<leader>bb", require("telescope.builtin").current_buffer_fuzzy_find },
	},
	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				file_ignore_patterns = { "node_modules", "dist" },

				mappings = {
					n = {
						["<C-d>"] = actions.delete_buffer,
						["<C-h>"] = actions.preview_scrolling_left,
						["<C-j>"] = actions.preview_scrolling_down,
						["<C-k>"] = actions.preview_scrolling_up,
						["<C-l>"] = actions.preview_scrolling_right,
					}, -- n
					i = {
						["<C-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
			pickers = {
				buffers = {
					initial_mode = "normal",
				},
				lsp_references = {
					initial_mode = "normal",
				},
			},
		}
	end,
}
