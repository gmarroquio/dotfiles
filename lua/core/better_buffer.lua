local bufnr = vim.fn.bufnr
local buflisted = vim.fn.buflisted
local bufwinnr = vim.fn.bufwinnr

local BetterBufferNext = function()
	for b = (bufnr("%") + 1), bufnr("$"), 1 do
		if buflisted(b) == 1 and bufwinnr(b) == -1 then
			local command = "buffer " .. b
			vim.cmd(command)
			return
		end
	end

	for b = 1, bufnr("%") - 1, 1 do
		if buflisted(b) == 1 and bufwinnr(b) == -1 then
			local command = "buffer " .. b
			vim.cmd(command)
			return
		end
	end
end

local BetterBufferPrev = function()
	for b = bufnr("%") - 1, 1, -1 do
		if buflisted(b) == 1 and bufwinnr(b) == -1 then
			local command = "buffer " .. b
			vim.cmd(command)
			return
		end
	end

	for b = (bufnr("$")), bufnr("%") + 1, -1 do
		if buflisted(b) == 1 and bufwinnr(b) == -1 then
			local command = "buffer " .. b
			vim.cmd(command)
			return
		end
	end
end

vim.keymap.set("n", "L", BetterBufferNext)
vim.keymap.set("n", "H", BetterBufferPrev)
