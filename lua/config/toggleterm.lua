import("toggleterm", function (toggleterm)
  toggleterm.setup({
    open_mapping = [[<c-\>]],
    terminal_mappings = true,
    insert_mappings = true,
    shade_terminals = false,
    start_in_insert = false,
  })

  function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end)
