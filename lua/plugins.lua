return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim") -- Packer
  use("windwp/nvim-autopairs") -- auto pair
  use("42Paris/42header") -- Header da 42
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter (ainda n sei mt bem o que é)
  use("kyazdani42/nvim-web-devicons")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  })
  use("ahmedkhalf/project.nvim") -- Projects
  use({"styled-components/vim-styled-components", branch = "main" })
  use("nvim-lualine/lualine.nvim")
  use("chrisbra/Colorizer") -- coloca cor nas #
  use("morhetz/gruvbox") -- theme
  use("nvim-treesitter/nvim-treesitter-context")
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- fold 
end)
