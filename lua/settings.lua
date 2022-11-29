local o = vim.o
local opt = vim.opt

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

o.relativenumber = true
o.number = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.undofile = true

-- set termguicolors to enable highlight groups
opt.termguicolors = true

-- configure cursor
opt.guicursor = {
    "n-v:block",
    "i-c-ci-ve:ver25",
    "r-cr:hor20",
    "o:hor50",
    "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Use system clipboard: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
-- Install win32yank.exe, put this in, and nothing else
opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 30 }
  end,
})

local configs = require('nvim-treesitter.configs')
configs.setup {
    ensure_installed = "go",
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = { enable = true },
    autopairs = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.inner",
                ["ib"] = "@block.inner",
            },
            include_surrounding_whitespace = true,
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 2000, -- Do not enable for files with more than specified lines
    },
}

-- telescope setup --
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('repo')
telescope.load_extension('neoclip')
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
        find_files = {
            theme = "ivy",
            layout_config = { height = 0.7 },
        }
    },
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

require('Comment').setup()
require('git').setup()
require('nvim-autopairs').setup()
require('luasnip').filetype_extend("go", { "go" })
require('lualine').setup()

require'nvim-treesitter.configs'.setup {
}
