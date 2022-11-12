import({"mason-null-ls", "null-ls", "mason-null-ls.automatic_setup"}, function (modules)
  local mason_null_ls = modules["mason-null-ls"]
  local mason_automatic_setup = modules["mason-null-ls.automatic_setup"]
  local null_ls = modules["null-ls"]

  mason_null_ls.setup({
    ensure_installed = {'stylua', 'prettier'}
  })

  mason_null_ls.setup_handlers {
    function(source_name, methods)
      -- all sources with no handler get passed here
      -- Keep original functionality of `automatic_setup = true`
      mason_automatic_setup(source_name, methods)
    end,
    stylua = function()
      null_ls.register(null_ls.builtins.formatting.stylua)
    end,
  }

  -- will setup any installed and configured sources above
  null_ls.setup()
end)
