vim.keymap.set("n", "a", function()
  local full_dir = vim.fn.expand("%:p")
  local name = vim.fn.input("filename: ")
  local full_name = full_dir .. '/' .. name

  vim.cmd('silent !mkdir -p "$(dirname "' .. full_name .. '")" && touch "' .. full_name .. '"')
end, { buffer = true })

vim.keymap.set("n", "<Leader>e", ":Rex<CR>", { buffer = true, silent = true })
