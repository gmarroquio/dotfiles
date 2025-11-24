return {
	{ "windwp/nvim-autopairs", opts = {
		disable_filetype = { "TelescopePrompt", "vim" },
	} },
	{
		"windwp/nvim-ts-autotag",
		opts = {
			{
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
			per_filetype = {
				["html"] = {},
			},
		},
	},
}
