local status, gitsigns = pcall(require, "gitsigns")
if(not status) then return end

gitsigns.setup(
  {
    signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  }
)
