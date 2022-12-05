import({ "cmp", "luasnip", "lspkind", "luasnip/loaders/from_vscode" }, function(modules)
	modules["luasnip/loaders/from_vscode"].lazy_load()

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	modules.cmp.setup({
		snippet = {
			expand = function(args)
				modules.luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-k>"] = modules.cmp.mapping.select_prev_item(),
			["<C-j>"] = modules.cmp.mapping.select_next_item(),
			["<C-b>"] = modules.cmp.mapping(modules.cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = modules.cmp.mapping(modules.cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = modules.cmp.mapping(modules.cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = modules.cmp.config.disable,
			["<C-e>"] = modules.cmp.mapping({
				i = modules.cmp.mapping.abort(),
				c = modules.cmp.mapping.close(),
			}),
			["<CR>"] = modules.cmp.mapping.confirm({ select = true }),
			["<Tab>"] = modules.cmp.mapping(function(fallback)
				if modules.cmp.visible() then
					modules.cmp.select_next_item()
				elseif modules.luasnip.expandable() then
					modules.luasnip.expand()
				elseif modules.luasnip.expand_or_jumpable() then
					modules.luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = modules.cmp.mapping(function(fallback)
				if modules.cmp.visible() then
					modules.cmp.select_prev_item()
				elseif modules.luasnip.jumpable(-1) then
					modules.luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = modules.lspkind.cmp_format({
				mode = "symbol_text",
				before = function(entry, vim_item)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			}),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		confirm_opts = {
			behavior = modules.cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = modules.cmp.config.window.bordered(),
			documentation = modules.cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})

	modules.cmp.setup.cmdline({ "/", "?" }, {
		mapping = modules.cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	modules.cmp.setup.cmdline(":", {
		mapping = modules.cmp.mapping.preset.cmdline(),
		sources = modules.cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end)
