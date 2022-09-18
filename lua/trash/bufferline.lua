local bufferline = safe_require("bufferline")

if not bufferline then
	return
end

bufferline.setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
})
