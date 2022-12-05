-- Set leader to space
vim.g.mapleader = ' '

local function noremap(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true })
end

-- Save with <leader>
noremap('n', '<leader>s', ':w<CR>')
-- Quit with <leader>
noremap('n', '<leader>q', ':q<CR>')
-- Clear highlighted search
noremap('n', '<C-l>', ':nohlsearch<CR>')

noremap('n', '<C-u>', '<C-u>zz')
noremap('n', '<C-d>', '<C-d>zz')

-- Mimic shell movements
noremap('i', '<C-E>', '<ESC>A')
noremap('i', '<C-A>', '<ESC>I')

noremap("n", "C-r", ":luafile %<CR>")

-- Telescope stuff
local builtin = require('telescope.builtin')
noremap('n', '<leader>p', builtin.find_files)
noremap('n', '<leader>fa', builtin.live_grep) -- grep across all file in current directory
noremap('n', '<leader>fk', builtin.keymaps)
noremap('n', '<leader>fs', builtin.lsp_document_symbols)
noremap('n', '<leader>fb',function()
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
noremap('n', '<leader>fr', require('telescope').extensions.repo.repo)
noremap("n", "<leader>le", "<cmd>Telescope diagnostics<cr>")
noremap("n", "<leader>v", "<cmd>Telescope neoclip<cr>")
noremap('n', '<leader>h', builtin.help_tags) -- grep help docs
noremap('n', '<leader>gs', builtin.git_status)
noremap('n', '<C-f>', builtin.current_buffer_fuzzy_find)

local ls = require("luasnip")
noremap({ "i", "s" }, "<c-n>", ls.expand_or_jump)
noremap({ "i", "s" }, "<c-p>", function() ls.jump(-1) end)

-- lsp stuff
noremap("n", "K", vim.lsp.buf.hover)
noremap("n", "H", vim.lsp.buf.signature_help)
noremap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>zz") -- TODO: change this to a function, using vim.api.nvim_win_set_cursor
noremap("n", "gp", function() builtin.lsp_definitions({jump_type = "never"}) end)
noremap("n", "gi", vim.lsp.buf.implementation)
noremap("n", "gr", builtin.lsp_references)
noremap("n", "<leader>r", vim.lsp.buf.rename)
noremap("n", "<leader>e", vim.diagnostic.goto_next)
noremap('n', '<C- >', ':lua vim.lsp.buf.code_action()<CR>')
