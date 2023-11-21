local telescope = require("telescope")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "dist" },

		mappings = {
			n = {
				["<c-d>"] = require("telescope.actions").delete_buffer,
			}, -- n
			i = {
				["<C-h>"] = "which_key",
				["<c-d>"] = require("telescope.actions").delete_buffer,
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
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ path_display = { "truncate" } })
end, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>bi", function()
	builtin.current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") })
end, {})
vim.keymap.set("n", "<leader>bb", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fi", function()
	builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
end, {})
