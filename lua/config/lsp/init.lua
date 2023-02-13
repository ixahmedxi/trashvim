require("config.lsp.config")
require("config.lsp.fidget")
require("config.lsp.signature")
require("config.lsp.inc-rename")
require("config.lsp.lightbulb")
require("config.lsp.trouble")
require("config.lsp.barbecue")

import({ "mason", "mason-lspconfig", "lspconfig", "cmp_nvim_lsp" }, function(modules)
	local mason = modules.mason
	local masonLspConfig = modules["mason-lspconfig"]
	local cmpLsp = modules["cmp_nvim_lsp"]

	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	masonLspConfig.setup({
		ensure_installed = {
			"lua_ls",
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
			"rust_analyzer",
		},
	})

	local opts = {
		capabilities = cmpLsp.default_capabilities(),
		on_attach = require("config.lsp.on_attach").on_attach,
	}

	masonLspConfig.setup_handlers({
		function(server_name)
			local has_custom_opts, custom_opts = pcall(require, "config.lsp.settings." .. server_name)

			local server_opts = opts

			if has_custom_opts then
				server_opts = vim.tbl_deep_extend("force", custom_opts, opts)
			end

			modules.lspconfig[server_name].setup(server_opts)
		end,
		["tsserver"] = function()
			import("typescript", function(typescript)
				typescript.setup({
					server = opts,
				})
			end)
		end,
		["rust_analyzer"] = function()
			import("rust-tools", function(rustTools)
				rustTools.setup({ server = opts })
			end)
		end,
	})

	require("config.lsp.null-ls")
end)
