vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local fugitiveGroup = vim.api.nvim_create_augroup("fugitiveGroup", {})
local gitsigns = require("gitsigns")

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = fugitiveGroup,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }
		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git("push")
		end, opts)

		vim.keymap.set("n", "cn", function()
			vim.cmd.Git({ "commit", "--no-verify" })
		end, opts)

		-- NOTE: It allows me to easily set the branch i am pushing and any tracking
		-- needed if i did not set the branch up correctly
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	end,
})

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

vim.keymap.set("n", "gph", ":Gitsigns preview_hunk<CR>", { silent = true })
