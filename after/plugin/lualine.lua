local status, lualine = pcall(require, "lualine")

if not status then
	print("lualine not installer")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"mode",
			},
			{
				"buffers",
			},
		},
		lualine_c = {
			{
				"filename",
				path = 4,
			},
		},
	},
})
