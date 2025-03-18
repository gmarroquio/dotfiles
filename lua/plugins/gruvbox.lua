return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme gruvbox]])
		vim.g.airline_theme = "gruvbox"
		vim.opt.termguicolors = true
		vim.cmd("hi Normal ctermbg=none guibg=none")
	end,
}
