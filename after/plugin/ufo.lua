local status, ufo = pcall(require, "ufo")
if not status then
	return
end

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
