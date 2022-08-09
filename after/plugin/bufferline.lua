local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end
bufferline.setup({
  options = {
    numbers = "ordinal",
    mode = "buffers",
    indicator_icon = "│",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    tab_size = 20,
    offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1 } },
    show_buffer_icons = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    always_show_bufferline = false
  }
})
