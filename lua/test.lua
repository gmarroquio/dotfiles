local lastBuffer = { 1, 1 }
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.*" },
  desc = "Save on the buffer to return on close",
  callback = function()
    lastBuffer[1] = lastBuffer[2]
    lastBuffer[2] = vim.api.nvim_get_current_buf()
  end,
})

local function checkIfBufferExists(buf)
  print(buf)
  if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
    return true
  else
    return false
  end
end

local function getBufferFromList()
  local bufList = vim.api.nvim_list_bufs()
  local length = #bufList
  if length > 0 then
    return bufList[1]
  else
    return 0
  end
end

vim.keymap.set("n", "<Leader>c", function()
  local bufToDelete = vim.fn.bufnr()
  if checkIfBufferExists(lastBuffer[1]) then
    vim.cmd("b" .. lastBuffer[1])
  elseif getBufferFromList() > 0 then
    vim.cmd("b" .. getBufferFromList())
  else
    vim.cmd("enew")
  end
  if vim.api.nvim_get_option_value('filetype', { buf = bufToDelete }) ~= "netrw" then
    vim.cmd("bd! " .. bufToDelete)
  end
end, { silent = true })
