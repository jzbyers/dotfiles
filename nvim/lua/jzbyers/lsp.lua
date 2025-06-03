local on_attach = function(_, _)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', {})

  -- Configure lsp_document_symbols with wider columns
  vim.keymap.set('n', '<leader>ds', function()
    builtin.lsp_document_symbols({
      fname_width = 50,    -- Set the desired width for the filename section
      symbol_width = 50,   -- Set the desired width for the symbol section
    })
  end)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config['gopls'] = {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}
vim.lsp.enable('gopls')

-- completions and snippet config below (this could be a separate file)
local cmp = require("cmp")
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
}
