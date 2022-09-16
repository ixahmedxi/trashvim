local status_ok, trueZen = pcall(require, "true-zen")
if not status_ok then
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
