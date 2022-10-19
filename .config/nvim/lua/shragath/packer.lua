-- Install packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

return require('packer').startup({
    function(use)

        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Speed up require in Lua
        use 'lewis6991/impatient.nvim'

        -- Tree file explorer
        use { "nvim-telescope/telescope-file-browser.nvim" }

        -- Start up time
        use 'dstein64/vim-startuptime'

        -- nvim-treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
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
        use { 'Julpikar/night-owl.nvim', config = function()
            require("night-owl")
        end }

        -- Snippets
        use 'norcalli/snippets.nvim'

        -- Rainbow Parentheses
        use 'p00f/nvim-ts-rainbow'

        -- nvim lsppacker
        use {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
        }
        use { 'simrat39/rust-tools.nvim', config = function()
            require('rust-tools').setup({})
        end }
        use { 'nvim-telescope/telescope-ui-select.nvim' }
        -- Debugging
        use 'mfussenegger/nvim-dap'

        use 'nvim-lua/lsp-status.nvim'
        use { 'hrsh7th/nvim-cmp', config = "require('shragath.config.cmp')" }
        use 'onsails/lspkind-nvim'
        -- Source
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-emoji'
        use 'kdheepak/cmp-latex-symbols'
        use 'hrsh7th/cmp-calc'
        use 'hrsh7th/cmp-cmdline'
        use 'f3fora/cmp-spell'
        -- Snippets
        use { 'L3MON4D3/LuaSnip', config = "require('shragath.config.luasnip')" }
        use 'saadparwaiz1/cmp_luasnip'

        -- File search
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use { 'nvim-telescope/telescope.nvim', config = "require('shragath.config.telescope')" }
        use 'ThePrimeagen/harpoon'

        -- LSP servers
        use({
            "jose-elias-alvarez/null-ls.nvim",
            -- config = "require('lsp.null-ls')",
            requires = { "nvim-lua/plenary.nvim" },
        })

        -- Comment
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

        use({
            "kylechui/nvim-surround",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        })

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
            requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
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
        -- use 'tpope/vim-fugitive'
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

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
        use {
            'phaazon/hop.nvim',
            config = function()
                require('hop').setup()
            end
        }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {}
            end
        }

        -- Latex support
        use { 'lervag/vimtex' }

        -- Emmet
        use 'mattn/emmet-vim'

        -- Terminal
        use { 'akinsho/nvim-toggleterm.lua', config = "require('shragath.config.terminal')" }

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
})
