local function map_key(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- Save with ctrl-s
map_key('n', '<C-s>', ':w<cr>')

-- Set leader to space
vim.g.mapleader = ' '

-- Mimic shell movements
map_key('i', '<C-E>', '<ESC>A')
map_key('i', '<C-A>', '<ESC>I')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {}) 
vim.keymap.set('n', '<leader>fa', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser, { noremap = true }) -- file browser
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
