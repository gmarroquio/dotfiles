local status, prettier = pcall(require, "prettier")
if (not status) then print("Prettier not installed") return end

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
    "lua",
  },
  -- bracket_spacing = true,
  -- bracket_same_line = true,
  -- single_quote = false,
  -- trailing_comma = "all",
})
