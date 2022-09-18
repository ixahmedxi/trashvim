-- https://gist.github.com/beauwilliams/05c02c7b957615498fd39012316b791b
-- @USAGE:
-- local foo = safe_require('foo')
-- if not foo then return end
_G.safe_require = function(module_name)
	local package_exists, module = pcall(require, module_name)
	if not package_exists then
		vim.defer_fn(function()
			vim.schedule(function()
				vim.notify("Could not load module: " .. module_name, "error", { title = "Module Not Found" })
			end)
		end, 1000)
		return nil
	else
		return module
	end
end
