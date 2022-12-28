import("lsp_signature", function(signature)
	signature.setup({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		toggle_key = "<M-x>",
		floating_window = false,
	})
end)
