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
  use({
    'kyazdani42/nvim-tree.lua',
    -- commit = 'bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243'
  })
  use({
    'lewis6991/gitsigns.nvim',
  })
  use('L3MON4D3/LuaSnip')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/nvim-cmp')
  use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }) -- Treesitter (ainda n sei mt bem o que é)
  use({'windwp/nvim-autopairs'}) -- auto pair
  use({'windwp/nvim-ts-autotag'})
  use({
   'numToStr/Comment.nvim',
   commit = 'fe9bbdbcd2f1b85cc8fccead68122873d94f8397',
   config = function()
     require('Comment').setup()
   end
  })
  use('akinsho/bufferline.nvim')
  use('christoomey/vim-tmux-navigator')
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    branch = 'neovim-pre-0.8.0'
  })
  use('ThePrimeagen/harpoon')
  use('mechatroner/rainbow_csv')
  use('pantharshit00/vim-prisma')
  use('tpope/vim-abolish')
  use('tpope/vim-surround')

  use({'shuntaka9576/preview-swagger.nvim', run = 'yarn install'})
  use({ 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', setup = function() vim.g.mkdp_filetypes = { 'markdown' } end, ft = { 'markdown' }, })
  use({ 'nvim-telescope/telescope-ui-select.nvim' })
end)
