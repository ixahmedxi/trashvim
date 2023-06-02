import({ "mason-null-ls", "null-ls" }, function(modules)
	local mason_null_ls = modules["mason-null-ls"]
	local null_ls = modules["null-ls"]

	mason_null_ls.setup({
		ensure_installed = { "stylua", "prettier" },
		handlers = {
			stylua = function()
				null_ls.register(null_ls.builtins.formatting.stylua)
			end,
		},
	})

	-- will setup any installed and configured sources above
	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end)
