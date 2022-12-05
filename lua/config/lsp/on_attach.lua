local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap

	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "tsserver" then
		keymap(bufnr, "n", "gd", "<cmd>TypescriptGoToSourceDefinition<CR>", opts)
	else
		keymap(bufnr, "n", "gd", "<cmd>Trouble lsp_definitions<CR>", opts)
	end

	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gt", "<cmd>Trouble lsp_type_definitions<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>Trouble lsp_implementations<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>Trouble lsp_references<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>rn", ":IncRename ", opts)
	keymap(bufnr, "n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opts)
	keymap(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap(bufnr, "n", "d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

return M
