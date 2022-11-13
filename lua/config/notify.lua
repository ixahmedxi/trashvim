import("notify", function(notify)
  notify.setup({
    timeout = 2000
  })
	vim.notify = notify
end)
