return require('packer').startup(
    function(use)

        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Speed up require in Lua
        use 'lewis6991/impatient.nvim'


        -- Start up time
        use 'dstein64/vim-startuptime'

        -- nvim-treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use('nvim-treesitter/playground')
        use 'RRethy/nvim-treesitter-textsubjects'
        -- use "ziontee113/syntax-tree-surfer"

        -- indentation guides
        use { 'lukas-reineke/indent-blankline.nvim', config = "require('shragath.config.indent-blankline')" }
        -- Icons
        use 'ryanoasis/vim-devicons'
        use 'kyazdani42/nvim-web-devicons' -- for file icons

        -- Status Bar
        use { 'nvim-lualine/lualine.nvim', config = "require('shragath.config.status-line')", }

        -- Themes
        -- use { 'Julpikar/night-owl.nvim', config = function()
        --     require("night-owl")
        -- end }
        use { "EdenEast/nightfox.nvim", config = function()
            require("nightfox").setup({
                palettes = {
                    -- Custom nightfox with darkened background
                    nightfox = {
                        bg1 = "#011627", -- Black background
                        -- bg0 = "#011627", -- Alt backgrounds (floats, statusline, ...)
                        -- bg3 = "#121820", -- 55% darkened from stock
                        -- sel0 = "#131b24", -- 55% darkened from stock
                        visual = "#1b3b51",
                    },
                },
            })
            vim.cmd("colorscheme nightfox")
        end }

        -- Rainbow Parentheses
        use 'p00f/nvim-ts-rainbow'

        -- LSP servers
        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }
        use {
            "jose-elias-alvarez/null-ls.nvim",
            "jayp0521/mason-null-ls.nvim",
        }
        use { 'simrat39/rust-tools.nvim' }
        use { 'nvim-telescope/telescope-ui-select.nvim' }
        -- Debugging -- To Do
        use 'mfussenegger/nvim-dap'

        use 'nvim-lua/lsp-status.nvim'
        -- use { 'hrsh7th/nvim-cmp', config = "require('shragath.config.cmp')" }
        use 'onsails/lspkind-nvim'
        -- Snippets
        -- use { 'L3MON4D3/LuaSnip', config = "require('shragath.config.luasnip')" }

        -- File search
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use { 'nvim-telescope/telescope.nvim', config = "require('shragath.config.telescope')" }
        -- Tree file explore
        use { "nvim-telescope/telescope-file-browser.nvim" }
        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
        use 'ThePrimeagen/harpoon'


        -- Comment
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

        -- Add/change surrounds
        use {
            "kylechui/nvim-surround",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        }

        -- Session manager
        use {
            'rmagatti/auto-session',
            config = function()
                require('auto-session').setup {
                    log_level = 'info',
                    auto_session_enabled = false,
                }
            end
        }
        use {
            'rmagatti/session-lens',
            -- requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
            config = function()
                require('session-lens').setup {
                    -- path_display = {'shorten'},
                    theme_conf = {
                        border = false
                    },
                    previewer = false
                }
            end
        }

        -- Undo tree history
        use 'mbbill/undotree'

        -- save as sudo
        use 'lambdalisue/suda.vim'

        -- Git
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

        use { 'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end
        }
        -- IDE
        use {
            "luukvbaal/stabilize.nvim",
            config = function()
                require("stabilize").setup()
            end
        }

        -- move motions
        use { "ggandor/leap.nvim", config = function()
            require('leap').add_default_mappings()
        end }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {}
            end
        }

        -- Jupyter notebook support
        use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins', opt = true }

        -- Latex support
        use { 'lervag/vimtex' }

        -- Emmet
        use({ 'mattn/emmet-vim', opt = true })

        -- Terminal
        use { 'akinsho/nvim-toggleterm.lua', tag = '*', config = function()
            require("toggleterm").setup()
        end }

        -- Signature help
        use 'ray-x/lsp_signature.nvim'

        -- Show Colors
        use {
            'NvChad/nvim-colorizer.lua',
            config = function()
                require('colorizer').setup()
            end
        }

        -- Buffer tabs
        use { 'romgrk/barbar.nvim', config = "require('shragath.config.barbar')" }

        -- makes vim autocomplete (), [], {}, '', ----, etc
        -- matches pairs of things (if-else, tags, etc)
        use { "windwp/nvim-autopairs", config = function() require('nvim-autopairs').setup {} end }

    end
)
