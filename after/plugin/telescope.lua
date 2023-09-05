local status, telescope = pcall(require, "telescope")
if not status then
	print("Telescope not installed")
	return
end

local Map = require("core.mapping")
local nnoremap = Map.nnoremap

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

-- telescope.load_extension("ui-select")

nnoremap("<leader>f", ":Telescope find_files<cr>")
nnoremap("<leader>gr", ":Telescope live_grep<cr>")
nnoremap("<leader>b", ":Telescope buffers<cr>")
nnoremap("<leader>h", ":Telescope help_tags<cr>")
nnoremap("<leader>t", ":TodoTelescope<cr>")
