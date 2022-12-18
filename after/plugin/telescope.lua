-- telescope setup --
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('repo')
telescope.setup({
    winblend = 10,
    defaults = {
        mappings = {
            i = {
                ['<C-\\>'] = 'select_vertical',
            },
            n = {
                ['<C-\\>'] = 'select_vertical',
            }
        }
    },
    pickers = {
        -- find_files = {
        --     theme = "ivy",
        --     layout_config = { height = 0.7 },
        -- },
        -- lsp_document_symbols = {
        --     theme = "ivy",
        --     layout_config = { height = 0.7 },
        -- }
    },
    layout_config = {
        height = 0.9,
        width = 0.9,
    }
})

-- Open Telescope find_files when opening nvim with a directory as first argument
_G.open_telescope = function()
    local first_arg = vim.v.argv[2]
    if first_arg and vim.fn.isdirectory(first_arg) == 1 then
        vim.g.loaded_netrw = true
        require("telescope.builtin").find_files({search_dirs = {first_arg}})
    end
end
vim.api.nvim_exec([[
augroup TelescopeOnEnter
    autocmd!
    autocmd VimEnter * lua open_telescope()
augroup END
]], false)

