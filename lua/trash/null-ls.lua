vim.api.nvim_create_augroup("LspFormattingOnSave", {})

local function set_formatting_keymap(client, buf)
	vim.keymap.set("n", "<Leader>f", function()
		local params = vim.lsp.util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, buf)
	end, { buffer = buf })
end

local function lsp_format_sync(client, buf, params, timeout)
	timeout = timeout or 1000

	local response = client.request_sync("textDocument/formatting", params, timeout, buf)
	if response.err then
		return
	end
	if response.result == nil then
		return
	end

	vim.lsp.util.apply_text_edits(response.result, buf, client.offset_encoding)
end

local function set_formatting_on_save(client, buf)
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = "LspFormattingOnSave",
		buffer = buf,
		callback = function()
			local params = vim.lsp.util.make_formatting_params({})
			lsp_format_sync(client, buf, params)
		end,
	})
end

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
	--on_attach = function(client, bufnr)
	--	if client.supports_method("textDocument/formatting") then
	--		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	--		vim.api.nvim_create_autocmd("BufWritePre", {
	--			group = augroup,
	--			buffer = bufnr,
	--			callback = function()
	--				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
	--				vim.lsp.buf.format({ bufnr = bufnr })
	--			end,
	--		})
	--	end
	--end,
	on_attach = function(client, buf)
		if client.supports_method("textDocument/formatting") and client.name == "null-ls" then
			set_formatting_keymap(client, buf)
			set_formatting_on_save(client, buf)
		end
	end,
})
