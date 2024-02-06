require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"javascript",
		"typescript",
		"tsx",
		"svelte",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
		enable_close_on_slash = false,
	},
	context_commentstring = {
		enable = true,
	},
})

require("ts_context_commentstring").setup({})
vim.g.skip_ts_context_commentstring_module = true
