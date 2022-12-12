require("tomasmota")

vim.cmd("colorscheme nightfox")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

P = function(v)
    print(vim.inspect(v))
    return v
end
