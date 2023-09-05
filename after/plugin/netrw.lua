local status, netrw = pcall(require, "netrw")
local mapping_status, mapping = pcall(require, "core.mapping")

if not status then
	print("netrw.nvim not installer")
	return
end

if not mapping_status then
	print("mapping not found")
	return
end

netrw.setup({
	icons = {
		symlink = "", -- Symlink icon (directory and file)
		directory = "", -- Directory icon
		file = "", -- File icon
	},
	use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
	mappings = {
		["a"] = function(p)
			local name = vim.fn.input("filename: ")
			local full_name = p.dir .. "/" .. name
			vim.cmd('silent !mkdir -p "$(dirname "' .. full_name .. '")" && touch "' .. full_name .. '"')
		end,
	},
})

vim.g.last_buffer_number = vim.api.nvim_buf_get_number(0)

local toggleNetrw = function()
	local ft = vim.bo.filetype
	if ft == "netrw" then
		vim.cmd("b" .. vim.g.last_buffer_number)
	else
		local cmd = "Explore"
		vim.g.last_buffer_number = vim.api.nvim_buf_get_number(0)
		vim.cmd(cmd)
	end
end

mapping.nnoremap("<leader>e", toggleNetrw, { silent = true })
