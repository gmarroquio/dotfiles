local telescope = require("telescope")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "dist" },
    mappings = {
      n = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      },
    },
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
    },
    lsp_references = {
      initial_mode = "normal",
    },
  },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
