-- Set leader to space
vim.g.mapleader = ' '

-- Save with <leader>
vim.keymap.set('n', '<leader>s', ':w<CR>')
-- Quit with <leader>
vim.keymap.set('n', '<leader>q', ':q<CR>')
-- Clear highlighted search
vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>')

vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Mimic shell movements
vim.keymap.set('i', '<C-E>', '<ESC>A')
vim.keymap.set('i', '<C-A>', '<ESC>I')

vim.keymap.set("n", "C-r", ":luafile %<CR>")

-- Telescope stuff
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files)
vim.keymap.set('n', '<leader>fa', builtin.live_grep) -- grep across all file in current directory
vim.keymap.set('n', '<leader>fk', builtin.keymaps)
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>fb',function()
    require("telescope").extensions.file_browser.file_browser({
        { cwd = '%:h' },
        require("telescope.themes").get_ivy({
            layout_config = { height = 0.7 },
            grouped = true,
            files = false,
            display_stat = false,
        })
    })
end)
vim.keymap.set('n', '<leader>fr', require('telescope').extensions.repo.repo)
vim.keymap.set("n", "<leader>le", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set('n', '<leader>h', builtin.help_tags) -- grep help docs
vim.keymap.set('n', '<leader>gs', builtin.git_status)
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find)

local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<c-n>", ls.expand_or_jump)
vim.keymap.set({ "i", "s" }, "<c-p>", function() ls.jump(-1) end)

-- lsp stuff
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "H", vim.lsp.buf.signature_help)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>zz") -- TODO: change this to a function, using vim.api.nvim_win_set_cursor
vim.keymap.set("n", "gp", function() builtin.lsp_definitions({jump_type = "never"}) end)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>e", vim.diagnostic.goto_next)
vim.keymap.set('n', '<C- >', ':lua vim.lsp.buf.code_action()<CR>')
