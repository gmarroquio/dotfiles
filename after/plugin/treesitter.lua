local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
	},
	ensure_installed = {
		"tsx",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"typescript",
		"javascript",
		"prisma",
		"c",
		"rust",
		"go",
		"help",
	},
	sync_install = false,
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
})

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx", "typescript", "typescriptreact" }

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true, -- Throttles plugin updates (may improve performance)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	show_all_context = false,
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
		rust = {
			"loop_expression",
			"impl_item",
		},
		typescript = {
			"class_declaration",
			"abstract_class_declaration",
			"else_clause",
		},
	},
})
