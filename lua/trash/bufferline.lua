local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  },
}
