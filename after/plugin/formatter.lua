require("formatter").setup({
	filetype = {
		javascriptreact = { require("formatter.defaults.prettierd") },
		javascript = { require("formatter.defaults.prettierd") },
		typescriptreact = { require("formatter.defaults.prettierd") },
		svelte = { require("formatter.defaults.prettierd") },
		typescript = { require("formatter.defaults.prettierd") },
		json = { require("formatter.defaults.prettierd") },
		markdown = { require("formatter.defaults.prettierd") },
		scss = { require("formatter.defaults.prettierd") },
		html = { require("formatter.defaults.prettierd") },
		css = { require("formatter.defaults.prettierd") },
		svg = { require("formatter.defaults.prettierd") },
		lua = { require("formatter.filetypes.lua").stylua },
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

vim.api.nvim_exec(
	[[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * FormatWrite
    augroup END
  ]],
	true
)
