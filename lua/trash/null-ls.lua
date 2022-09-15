require("mason-null-ls").setup({
	automatic_installation = false,
	ensure_installed = {
		"stylua",
		"prettier",
	},
})

require("mason-null-ls").check_install(true)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier,
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
