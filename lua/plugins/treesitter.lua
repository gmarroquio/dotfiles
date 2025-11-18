return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	event = "BufReadPost",
	opts_extend = { "ensure_installed" },
	opts = {
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
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
