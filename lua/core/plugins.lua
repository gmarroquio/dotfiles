local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		-- vim.cmd("packadd packer.nvim")
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "morhetz/gruvbox" }) -- theme
	use({ "nvim-tree/nvim-web-devicons" }) -- theme/icons
	use({ "nvim-lualine/lualine.nvim" }) -- line
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- fold
	use({ "lewis6991/gitsigns.nvim" }) -- show line changes git
	use({
		"numToStr/Comment.nvim",
		commit = "fe9bbdbcd2f1b85cc8fccead68122873d94f8397",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "christoomey/vim-tmux-navigator" })
	use({ "tpope/vim-abolish" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-fugitive" })
	use({ "prichrd/netrw.nvim" }) -- tree file

	-- svelte
	use({ "othree/html5.vim" })
	use({ "pangloss/vim-javascript" })
	use({ "evanleck/vim-svelte" })
	-- svelte

	use({ "neovim/nvim-lspconfig" })
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("MunifTanjim/prettier.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter (ainda n sei mt bem o que é)
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("windwp/nvim-ts-autotag")

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				-- suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
