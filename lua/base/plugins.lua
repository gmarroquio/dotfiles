local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "folke/neodev.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	{ "nvimdev/lspsaga.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		cmd = { "TSUpdateSync" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
	},

	-- git plugins
	{ "tpope/vim-fugitive" },
	{ "lewis6991/gitsigns.nvim" },

	{ "echasnovski/mini.pairs", version = "*" },
	{ "echasnovski/mini.comment", version = "*" },
	{ "echasnovski/mini.hipatterns", version = "*" },
	{ "echasnovski/mini.indentscope", version = "*" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
	},
	{ "christoomey/vim-tmux-navigator" },

	-- formatter
	{ "MunifTanjim/prettier.nvim" },
	{ "mhartington/formatter.nvim" },
	{ "MunifTanjim/eslint.nvim" },

	-- Fold plugins
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	{ "anuvyklack/pretty-fold.nvim" },
	{
		"anuvyklack/fold-preview.nvim",
		dependencies = { "anuvyklack/keymap-amend.nvim" },
	},
	{
		"razak17/tailwind-fold.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
	},
}

require("lazy").setup(plugins)
