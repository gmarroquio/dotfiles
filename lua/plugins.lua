return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim") -- Packer
  use("windwp/nvim-autopairs") -- auto pair
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter (ainda n sei mt bem o que é)
  use("42Paris/42header") -- Header da 42
  use("kyazdani42/nvim-web-devicons")
  use("akinsho/bufferline.nvim")
  use("akinsho/toggleterm.nvim") -- Terminal
  use({
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  })
  use("ahmedkhalf/project.nvim") -- Projects
  use("kyazdani42/nvim-tree.lua") -- Nvim tree
  use("pangloss/vim-javascript")
  use("leafgarland/typescript-vim")
  use("peitalin/vim-jsx-typescript")
  use({"styled-components/vim-styled-components", branch = "main" })
  use("nvim-lualine/lualine.nvim")
  use("chrisbra/Colorizer") -- coloca cor nas #
  use("kdheepak/lazygit.nvim") -- git, talvez eu mude
  use("morhetz/gruvbox") -- theme
  use("franbach/miramare") -- theme
  use("nvim-treesitter/nvim-treesitter-context")

  -- COC
  use({"neoclide/coc.nvim", branch = "release" })
  
end)
