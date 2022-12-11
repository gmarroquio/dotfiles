local status, netrw = pcall(require, "netrw")
local nnoremap = require("core.mapping").nnoremap
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

-- vim.go.NetrwIsOpen = 0

local ToggleNetrw = function (a)
  -- local netrw = vim.go.NetrwIsOpen

  if netwr then
  end
   -- let i = bufnr("$")
   -- while (i >= 1)
   --   if (getbufvar(i, "&filetype") == "netrw")
   --     silent exe "bwipeout " . i 
   --     endif
   --     let i-=1
   --     endwhile
   --     let g:NetrwIsOpen=0
   --   else
   --     let g:NetrwIsOpen=1
   --     silent Lexplore
   --     endif
   --     endfunction
end

-- Add your own mapping. For example:
nnoremap("<leader>e", ToggleNetrw, { silent = true })
