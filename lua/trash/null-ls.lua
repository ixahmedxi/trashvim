local mason_null_ls = safe_require("mason-null-ls")

if not mason_null_ls then
	return
end

local null_ls = safe_require("null-ls")

if not null_ls then
	return
end

mason_null_ls.setup({
	automatic_installation = false,
	ensure_installed = {
		"stylua",
		"prettier",
	},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
