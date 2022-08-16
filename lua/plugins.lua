local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim') -- Packer
  use('42Paris/42header') -- Header da 42
  use('kyazdani42/nvim-web-devicons')
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use('MunifTanjim/prettier.nvim')
  use('ahmedkhalf/project.nvim') -- Projects
  use({ 'styled-components/vim-styled-components', branch = 'main' })
  use('nvim-lualine/lualine.nvim') -- line
  use('chrisbra/Colorizer') -- coloca cor nas #
  use('morhetz/gruvbox') -- theme
  use('nvim-treesitter/nvim-treesitter-context')
  use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }) -- fold
  use({ 'kyazdani42/nvim-tree.lua' })
  use('L3MON4D3/LuaSnip')
  use('onsails/lspkind-nvim')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/nvim-cmp')
  use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }) -- Treesitter (ainda n sei mt bem o que é)
  use('windwp/nvim-autopairs') -- auto pair
end)
