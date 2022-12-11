local status, netrw = pcall(require, "netrw")
if (not status) then
  print("netrw.nvim not installer")
  return
end

netrw.setup{
  icons = {
    symlink = '', -- Symlink icon (directory and file)
    directory = '', -- Directory icon
    file = '', -- File icon
  },
  use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
  mappings = {
    ["a"] = function(p)
      local name = vim.fn.input("filename: ")
      print(vim.inspect(p, name))
    end
  }, -- Custom key mappings
}
