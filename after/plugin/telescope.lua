require("telescope").setup{
	defaults = {
		file_ignore_patterns = { "node_modules", "dist" }
	}
}

require('telescope').load_extension('projects')
require('telescope').load_extension('harpoon')

