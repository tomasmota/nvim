require'lspconfig'.gopls.setup{
    on_attach = function()
        -- go.nvim setup
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
           require('go.format').goimport()
          end,
          group = format_sync_grp,
        })
        require('go').setup()
    end,
}

require'lspconfig'.terraformls.setup{
    on_attach = function()
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
    end,
}

require'lspconfig'.luau_lsp.setup{}
