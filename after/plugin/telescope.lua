local status, telescope = pcall(require, "telescope")
if (not status) then print("Telescope not installed") return end

telescope.setup{
	defaults = {
		file_ignore_patterns = { "node_modules", "dist" }
	}
}

telescope.load_extension('projects')
telescope.load_extension('harpoon')
telescope.load_extension("ui-select")

