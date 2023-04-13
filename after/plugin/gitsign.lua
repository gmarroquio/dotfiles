local status, gitsigns = pcall(require, "gitsigns")
local map = require("core.mapping")
if not status then
	print("gitsigns not installed")
	return
end

gitsigns.setup({
	signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 250,
		ignore_whitespace = false,
	},
	preview_config = {
		-- Options passed to nvim_open_win
		border = "rounded",
	},
})

map.nnoremap("gph", ":Gitsigns preview_hunk<CR>", { silent = true })
