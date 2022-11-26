-- Set leader to space
vim.g.mapleader = ' '

local function map_key(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- Save with <leader>s
map_key('n', '<leader>s', ':w<CR>')

-- - Mimic shell movements
map_key('i', '<C-E>', '<ESC>A')
map_key('i', '<C-A>', '<ESC>I')

-- Telescope stuff
local builtin = require('telescope.builtin')
map_key('n', '<C-p>', function() builtin.find_files { hidden = true } end) 
map_key('n', '<leader>fa', builtin.live_grep)
map_key('n', '<leader>fk', builtin.keymaps)
map_key('n', '<leader>fs', builtin.lsp_document_symbols)
map_key('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser) -- file browser
map_key("n", "<leader>le", "<cmd>Telescope diagnostics<cr>")
map_key('n', '<leader>h', builtin.help_tags)
map_key('n', '<leader>gs', builtin.git_status)
map_key('n', '<C-f>', builtin.current_buffer_fuzzy_find)

local ls = require("luasnip")
map_key({ "i", "s" }, "<C-l>", ls.expand_or_jump)
map_key({ "i", "s" }, "<C-h>", function() ls.jump(-1) end)

-- lsp stuff
map_key("n", "K", vim.lsp.buf.hover)
map_key("n", "gd", vim.lsp.buf.definition)
map_key("n", "gD", vim.lsp.buf.declaration)
map_key("n", "gi", vim.lsp.buf.implementation)
map_key("n", "gr", vim.lsp.buf.references)
map_key("n", "<leader>r", vim.lsp.buf.rename)
map_key("n", "<leader>e", vim.diagnostic.goto_next)
map_key('n', '<C- >', ':lua vim.lsp.buf.code_action()<CR>')
