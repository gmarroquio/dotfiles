local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  bracket_spacing = true,
  bracket_same_line = true,
  single_quote = false,
  trailing_comma = "all",
  prettier.setup({
    ["null-ls"] = {
      runtime_condition = function(params)
        -- return false to skip running prettier
        return true
      end,
      timeout = 5000,
    }
  })
})
