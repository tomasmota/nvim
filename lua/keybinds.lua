-- Set leader to space
vim.g.mapleader = ' '

local function noremap(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true })
end

-- Save with <leader>
noremap('n', '<leader>s', ':w<CR>')

-- - Mimic shell movements
noremap('i', '<C-E>', '<ESC>A')
noremap('i', '<C-A>', '<ESC>I')
noremap("n", "C-r", ":luafile %<CR>", { noremap = true })


-- Telescope stuff
local builtin = require('telescope.builtin')
noremap('n', '<C-p>', function() builtin.find_files { hidden = true } end) 
noremap('n', '<leader>fa', builtin.live_grep) -- grep across all file in current directory
noremap('n', '<leader>fk', builtin.keymaps) 
noremap('n', '<leader>fs', builtin.lsp_document_symbols) 
noremap('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser) 
noremap('n', '<leader>fr', require('telescope').extensions.repo.repo)
noremap("n", "<leader>le", "<cmd>Telescope diagnostics<cr>")
noremap('n', '<leader>h', builtin.help_tags) -- grep help docs
noremap('n', '<leader>gs', builtin.git_status)
noremap('n', '<C-f>', builtin.current_buffer_fuzzy_find)

local ls = require("luasnip")
noremap({ "i", "s" }, "<C-l>", ls.expand_or_jump)
noremap({ "i", "s" }, "<C-h>", function() ls.jump(-1) end)

-- lsp stuff
noremap("n", "K", vim.lsp.buf.hover)
noremap("n", "gd", vim.lsp.buf.definition)
noremap("n", "gD", vim.lsp.buf.declaration)
noremap("n", "gi", vim.lsp.buf.implementation)
noremap("n", "gr", vim.lsp.buf.references)
noremap("n", "<leader>r", vim.lsp.buf.rename)
noremap("n", "<leader>e", vim.diagnostic.goto_next)
noremap('n', '<C- >', ':lua vim.lsp.buf.code_action()<CR>')
