local mason = safe_require("mason")

if not mason then
	return
end

mason.setup()

local m = safe_require("mason-lspconfig")

if not m then
	return
end

local lspconfig = safe_require("lspconfig")

if not lspconfig then
	return
end

m.setup({
	ensure_installed = {
		"sumneko_lua",
		"jsonls",
		"tsserver",
		"eslint",
		"prismals",
		"tailwindcss",
		"html",
		"cssls",
		"astro",
		"yamlls",
		"taplo",
		"marksman",
		"dockerls",
		"cssmodules_ls",
		"volar",
		"angularls",
	},
})

require("trash.lsp.config")

local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")

if not cmp_nvim_lsp then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities

local opts = {
	capabilities = capabilities,
	on_attach = require("trash.lsp.on_attach").on_attach,
}

local typescript = safe_require("typescript")

if not typescript then
	return
end

m.setup_handlers({
	function(server_name)
		local has_custom_opts, custom_opts = pcall(require, "trash.lsp.settings." .. server_name)

		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", custom_opts, opts)
		end

		lspconfig[server_name].setup(opts)
	end,
	["tsserver"] = function()
		typescript.setup({
			server = opts,
		})
	end,
})
