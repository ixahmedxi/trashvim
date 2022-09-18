local trueZen = safe_require("true-zen")

if not trueZen then
	return
end

trueZen.setup({
	modes = {
		minimalist = {
			options = {
				number = true,
				relativenumber = true,
				ruler = true,
			},
		},
	},
})
