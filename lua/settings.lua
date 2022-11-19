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

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "go",
  highlight = {
    enable = true,
  }
}
