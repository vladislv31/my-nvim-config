require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'sumneko_lua', 'tsserver', 'eslint', 'svelte' }
})

local on_attach = function(client, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  if client.name == 'tsserver' then
    client.server_capabilities.document_formating = false
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
