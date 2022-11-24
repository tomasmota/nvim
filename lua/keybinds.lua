-- Set leader to space
vim.g.mapleader = ' '

local function map_key(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- Save with ctrl-s
map_key('n', '<C-s>', ':w<cr>')
map_key('n', '<leader>as', ':ASToggle<CR>')

-- Mimic shell movements
map_key('i', '<C-E>', '<ESC>A')
map_key('i', '<C-A>', '<ESC>I')

local builtin = require('telescope.builtin')
map_key('n', '<c-p>', function() builtin.find_files { hidden = true } end, {}) 
-- map_key('n', '<c-p>', builtin.find_files(opts), {}) 
map_key('n', '<leader>fa', builtin.live_grep, {})
map_key('n', '<leader>fk', builtin.keymaps, {})
map_key('n', '<leader>fs', builtin.lsp_document_symbols, {})
map_key('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser, { noremap = true }) -- file browser
-- find out how to upen file_browser inside the vim config from anywhere
map_key('n', '<leader>h', builtin.help_tags, {})
map_key('n', '<leader>gs', builtin.git_status, {})
map_key('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})

local ls = require("luasnip")
map_key({ "i", "s" }, "<C-l>", ls.expand_or_jump)
map_key({ "i", "s" }, "<C-h>", function() ls.jump(-1) end)
