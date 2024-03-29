local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = lsp_zero.preset({})

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 100,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    -- if you have a working setup with null-ls
    -- you can specify filetypes it can format.
    ['tsserver'] = { 'javascript', 'typescript' },
    ['svelte'] = { 'svelte' },
  }
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.svelte.setup({
  capabilities = lsp_capabilities,
  on_attach = function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
  end,
})

lspconfig.tsserver.setup({
  capabilities = lsp_capabilities,
  on_attach = function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
  end,
})

lspconfig.tailwindcss.setup({
  capabilities = lsp_capabilities,
  on_attach = function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
  end,
})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }
})
