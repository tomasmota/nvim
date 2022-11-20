local function map_key(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end


-- Set leader to space
vim.g.mapleader = ' '
-- Mimic shell movements
map_key('i', '<C-E>', '<ESC>A')
map_key('i', '<C-A>', '<ESC>I')

-- nvim-tree mappings
map_key("n", "<C-\\>", ":NvimTreeToggle<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) 
vim.keymap.set('n', '<leader>fa', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fb', require "telescope".extensions.file_browser.file_browser, { noremap = true }) -- file browser
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
