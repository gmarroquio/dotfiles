local nnoremap = require("mapping").nnoremap
--EXAMPLES
--BUG: this tis a bug
--TODO: this is a todo
--HACK: this is a weird code
--WARN: this is a warning
--PERF: this is a performance issue
--NOTE: this is a note

nnoremap("<leader>t", ":TodoTelescope<CR>", { silent = true })

