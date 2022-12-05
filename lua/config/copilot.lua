import({ "copilot", "copilot_cmp" }, function(modules)
	local copilot_cmp = modules["copilot_cmp"]

	modules.copilot.setup()
	copilot_cmp.setup()
end)
