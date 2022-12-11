local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('morhetz/gruvbox') -- theme
  use('nvim-tree/nvim-web-devicons')
  use('nvim-lualine/lualine.nvim') -- line
  use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }) -- fold
  use({
    'lewis6991/gitsigns.nvim',
  })
  use({
   'numToStr/Comment.nvim',
   commit = 'fe9bbdbcd2f1b85cc8fccead68122873d94f8397',
   config = function()
     require('Comment').setup()
   end
  })
  use('christoomey/vim-tmux-navigator')
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    branch = 'neovim-pre-0.8.0'
  })
  use('tpope/vim-abolish')
  use('tpope/vim-surround')
  use('prichrd/netrw.nvim') -- tree file

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use('L3MON4D3/LuaSnip')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/nvim-cmp')
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use('MunifTanjim/prettier.nvim')

  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }) -- Treesitter (ainda n sei mt bem o que Ž)
  use({ 'nvim-telescope/telescope-ui-select.nvim' })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
