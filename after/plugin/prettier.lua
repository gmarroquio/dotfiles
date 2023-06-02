local status, prettier = pcall(require, "prettier")
if not status then
	return
end

-- prettier.setup({
-- 	-- bin = "prettierd",
-- 	-- filetypes = {
-- 	-- 	"css",
-- 	-- 	"javascript",
-- 	-- 	"javascriptreact",
-- 	-- 	"typescript",
-- 	-- 	"typescriptreact",
-- 	-- 	"json",
-- 	-- 	"scss",
-- 	-- 	"less",
-- 	-- 	"svelte",
-- 	-- },
-- 	-- bracket_spacing = true,
-- 	-- bracket_same_line = false,
-- 	-- single_quote = true,
-- 	-- trailing_comma = "all",
-- })
