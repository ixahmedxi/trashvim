require('mason').setup()

local m = require('mason-lspconfig')
local lspconfig = require('lspconfig')

m.setup({
  ensure_installed = {
    "sumneko_lua",
    "jsonls",
    "tsserver",
    "eslint",
    "prisma",
    "tailwindcss",
    "html",
    "cssls",
    "astro",
  },
})

require('trash.lsp.config')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  on_attach = require('trash.lsp.on_attach').on_attach
}

m.setup_handlers({
  function (server_name)
    local has_custom_opts, custom_opts = pcall(require, "trash.lsp.settings." .. server_name)

    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", custom_opts, opts)
    end

    lspconfig[server_name].setup(opts)
  end,
  ['tsserver'] = function ()
    require('typescript').setup({
      server = opts
    })
  end,
})
