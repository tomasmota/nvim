return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'ray-x/go.nvim'

    use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'} -- nice for e.g. embedded terminal

    use 'neovim/nvim-lspconfig'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Themes
	use 'EdenEast/nightfox.nvim'

    -- Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- requires https://github.com/BurntSushi/ripgrep
    -- requires https://github.com/sharkdp/fd (sudo apt install fd-find)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'nvim-telescope/telescope-file-browser.nvim'
    -- requires locate (sudo apt install locate)
    use 'cljoly/telescope-repo.nvim'
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'
    use 'rafamadriz/friendly-snippets'
    use 'ray-x/lsp_signature.nvim'
    use {
        'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }

    -- Comments
    use {
        'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
          require('lualine').setup({
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                }
            }
        })
        end
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end
    }
end)

