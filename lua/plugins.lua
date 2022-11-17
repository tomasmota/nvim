return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'ray-x/go.nvim'

	use "EdenEast/nightfox.nvim"

end)
