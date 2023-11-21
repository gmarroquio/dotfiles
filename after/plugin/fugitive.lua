vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local fugitiveGroup = vim.api.nvim_create_augroup("fugitiveGroup", {})

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
