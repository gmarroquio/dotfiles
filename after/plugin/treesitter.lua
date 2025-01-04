local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	folding = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	modules = {},
	ensure_installed = {
		"vimdoc",
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"graphql",
		"markdown",
		"markdown_inline",
		"yaml",
		"swift",
		"css",
		"html",
		"lua",
		"typescript",
		"javascript",
		"prisma",
		"svelte",
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername =
	{ "javascript", "typescript.tsx", "typescript", "javascript.jsx", "typescriptreact", "graphql" }
