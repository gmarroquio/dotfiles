vim.keymap.set("n", "<Leader>q", ":q<CR>", { silent = true }) -- close window
vim.keymap.set("n", "<Leader>e", ":Ex<CR>", { silent = true }) -- open netrw

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { silent = true })

-- buffer movment
vim.keymap.set("n", "<Leader>c", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true })

-- split
vim.keymap.set("n", "sv", ":vsplit<cr>", { silent = true })
vim.keymap.set("n", "ss", ":split<cr>", { silent = true })

-- jump
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

vim.keymap.set("x", "p", '"_dP')
