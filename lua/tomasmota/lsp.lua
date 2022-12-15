local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    },
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

lspconfig.yamlls.setup{
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
    capabilities = capabilities,
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
            }
        }
    }
}

-- https://github.com/hashicorp/terraform-ls
lspconfig.terraformls.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
        vim.keymap.set("n", "<leader>tf", "<cmd>!terraform fmt<cr>", { noremap = true })
        -- vim.api.nvim_create_autocmd({"BufWritePre"}, {
        --     pattern = {"*.tf", "*.tfvars"},
        --     callback = vim.lsp.buf.formatting_sync,
        -- })
    end,
}
-- https://github.com/terraform-linters/tflint#installation
lspconfig.tflint.setup{}

-- language server configured according to this: https://terminalroot.com/how-to-install-lua-lsp-on-neovim/
lspconfig.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- markdown
lspconfig.marksman.setup{}

lspconfig.rust_analyzer.setup{
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.rs",
        command = "silent !cargo fmt"
    })
}

-- nvim.lsp_signature setup
require('lsp_signature').setup({
    hint_prefix = "🌟 ",
    handler_opts = {
      border = "rounded" -- double, single, shadow, none
    },
    hi_parameter = "IncSearch"
})
