local function map_key(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

require'lspconfig'.gopls.setup{
    on_attach = function()
        map_key("n", "K", vim.lsp.buf.hover)
        map_key("n", "gd", vim.lsp.buf.definition)
        map_key("n", "gD", vim.lsp.buf.declaration)
        map_key("n", "gi", vim.lsp.buf.implementation)
        map_key("n", "gr", vim.lsp.buf.references)
        map_key("n", "<leader>r", vim.lsp.buf.rename)
        map_key("n", "<leader>e", vim.diagnostic.goto_next)
        map_key("n", "<leader>le", "<cmd>Telescope diagnostics<cr>")
        map_key('n', '<C- >', ':lua vim.lsp.buf.code_action()<CR>')

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
