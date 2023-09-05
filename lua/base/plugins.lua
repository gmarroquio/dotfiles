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
  "folke/neodev.nvim",
  { "ellisonleao/gruvbox.nvim",    priority = 1000 },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },
  {
    'nvimdev/lspsaga.nvim',
  },
  {
    'nvim-treesitter/nvim-treesitter', build = ":TSUpdate", cmd = { "TSUpdateSync" }
  },
  { 'echasnovski/mini.pairs',      version = '*' },
  { 'echasnovski/mini.hipatterns', version = '*' },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
  },
  'christoomey/vim-tmux-navigator',
  "lewis6991/gitsigns.nvim"
}

require("lazy").setup(plugins)
