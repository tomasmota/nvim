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

-- use system clipboard
-- vim.api.nvim_set_option("clipboard","unnamedplus")

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
}

-- telescope setup --
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.setup({
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
        }
      },
  })

require('Comment').setup()
require('git').setup()
require('nvim-autopairs').setup()
require('luasnip').filetype_extend("go", { "go" })
require('lsp_signature').setup()
require('lualine').setup()
