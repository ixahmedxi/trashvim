local dressing = safe_require("dressing")

if not dressing then
	return
end

dressing.setup({
	input = {
		enabled = true,
	},
})
