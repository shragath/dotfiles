-- Install plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "folke/which-key.nvim", cmd = "WhichKey" },
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    -- Start up time
    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
    },
    -- nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'nvim-treesitter/playground', cmd = "TSPlaygroundToggle"
    },
    'RRethy/nvim-treesitter-textsubjects',
    'nvim-treesitter/nvim-treesitter-context',
    --  "ziontee113/syntax-tree-surfer"
    { 'windwp/nvim-ts-autotag', config = true },

    -- indentation guides
    { 'lukas-reineke/indent-blankline.nvim', config = function() require('shragath.config.indent-blankline') end }, --
    -- Icons
    'ryanoasis/vim-devicons',
    'kyazdani42/nvim-web-devicons', -- for file icons

    -- Status Bar
    { 'nvim-lualine/lualine.nvim', config = function() require('shragath.config.status-line') end },

    -- Themes
    --  { 'Julpikar/night-owl.nvim', config = function()
    --     require("night-owl")
    -- end }
    { "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                palettes = {
                    -- Custom nightfox with darkened background
                    nightfox = {
                        bg1 = "#011627",
                        visual = "#1b3b51",
                    },
                },
            })
            vim.cmd("colorscheme nightfox")
        end },

    -- Rainbow Parentheses
    'p00f/nvim-ts-rainbow',

    -- LSP servers
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp', event = "InsertEnter", config = function() require('shragath.config.cmp') end }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            {"hrsh7th/cmp-nvim-lsp-signature-help"},
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lsp-document-symbol" },

            -- Snippets
            { 'L3MON4D3/LuaSnip', config = function() require('shragath.config.luasnip') end }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    { 'simrat39/rust-tools.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    'jose-elias-alvarez/typescript.nvim',

    -- Debugging -- To Do
    'mfussenegger/nvim-dap',

    'nvim-lua/lsp-status.nvim',
    'onsails/lspkind-nvim',

    -- File search
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        dependencies = {
            -- Tree file explore
            "nvim-telescope/telescope-file-browser.nvim",
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
        },
        config = function() require('shragath.config.telescope') end,
    },
    'ThePrimeagen/harpoon',


    -- Comment
    { 'numToStr/Comment.nvim', event = "InsertEnter", config = true },

    -- Add/change surrounds
    { "kylechui/nvim-surround", event = "InsertEnter", config = true },

    -- Session manager
    {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
                log_level = 'info',
                auto_session_enabled = false,
            }
        end,
        dependencies = {
            {
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
            },

        }
    },

    -- Undo tree history
    { 'mbbill/undotree', cmd = "UndotreeToggle" },

    -- save as sudo
    { 'lambdalisue/suda.vim', event = "VeryLazy" },

    -- Git
    { 'tpope/vim-fugitive', cmd = "Git" },
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    { 'lewis6991/gitsigns.nvim', config = true },
    -- IDE
    { "luukvbaal/stabilize.nvim", event = "VeryLazy", config = true },

    -- move motions
    { "ggandor/leap.nvim", config = function()
        require('leap').add_default_mappings()
    end },
    { "folke/trouble.nvim", config = true, cmd = "TroubleToggle" },

    -- Jupyter notebook support
    { 'dccsillag/magma-nvim', build = ':UpdateRemotePlugins', ft = "python" },

    -- Latex support
    { 'lervag/vimtex', ft = "tex" },

    -- Emmet
    { 'mattn/emmet-vim', ft = { "html", "js", "ts", "jsx", "tsx" } },

    -- Terminal
    { 'akinsho/nvim-toggleterm.lua', cmd = "ToggleTerm", version = "*", config = true },

    -- Signature help
    'ray-x/lsp_signature.nvim',

    -- Show Colors
    { 'NvChad/nvim-colorizer.lua', config = true, event = "VeryLazy" },

    -- Buffer tabs
    -- { 'romgrk/barbar.nvim', opts = { icons = {buffer_index = true, filetype = { enabled = false }} } },

    -- makes vim autocomplete (), [], {}, '', ----, etc
    -- matches pairs of things (if-else, tags, etc)
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

})
