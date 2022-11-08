import({"nvim-autopairs", "nvim-autopairs.completion.cmp", "cmp"}, function(modules)
  local cmp = modules.cmp
  local autopairs = modules["nvim-autopairs"]
  local cmp_autopairs = modules["nvim-autopairs.completion.cmp"]

  autopairs.setup({
    check_ts = true,
  })

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end)
