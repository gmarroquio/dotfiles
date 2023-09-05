vim.keymap.set('n', '<Leader>q', ':q<CR>', { silent = true })  -- close window
vim.keymap.set('n', '<Leader>e', ':Ex<CR>', { silent = true }) -- open netrw

-- save
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { silent = true })

-- buffer movment
vim.keymap.set('n', '<Leader>b', ':buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>c', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { silent = true })

-- split
vim.keymap.set('n', 'ss', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', 'sv', ':split<CR>', { silent = true })
