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
    { "folke/which-key.nvim",            cmd = "WhichKey" },
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    -- nvim-treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/playground',      cmd = "TSPlaygroundToggle" },
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-lua/plenary.nvim',
    --  "ziontee113/syntax-tree-surfer"
    { 'windwp/nvim-ts-autotag',           config = true },

    -- indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        config = function() require('shragath.config.indent-blankline') end
    }, --
    -- Status Bar
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('shragath.config.status-line') end
    },
    -- Themes
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                theme = "wave",
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                colors = {
                    theme = {
                        wave = {
                            ui = {
                                bg        = '#011627',
                                -- bg_dim = '#011627',
                                bg_gutter = '#011627',
                            },
                            diag = {
                                error = '#ebbcba', -- extended color 1
                            },
                        }
                    },
                },
            })

            vim.cmd.colorscheme('kanagawa')
            vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#536878', fg = '#16161D' })
        end
    },
    -- Inlay hints
    -- { 'lvimuser/lsp-inlayhints.nvim',     config = true,         branch = "anticonceal" },

    -- Rainbow Parentheses
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            -- This module contains a number of default definitions
            local rainbow_delimiters = require 'rainbow-delimiters'

            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    commonlisp = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
                blacklist = { 'c', 'cpp' },
            }
        end
    },

    -- LSP servers
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim',          build = ":MasonUpdate" },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('shragath.config.cmp')
        end
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { 'nvim-telescope/telescope-symbols.nvim' },

    -- Diagnostics
    { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        config = function() require('shragath.config.luasnip') end
    },
    { 'rafamadriz/friendly-snippets' },
    {
        "jose-elias-alvarez/null-ls.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    { 'simrat39/rust-tools.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    'jose-elias-alvarez/typescript.nvim',

    -- AI autocolmpletion
    {
        "jcdickinson/codeium.nvim",
        config = function()
            require("codeium").setup({})
        end
    },
    -- Debugging -- !ToDo()
    { 'mfussenegger/nvim-dap' },

    { 'onsails/lspkind-nvim' },

    -- Notes
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {},  -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = {      -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/notes",
                            tesis = "~/Documents/notes/tesis",
                            dev = "~/Documents/notes/dev"
                        },
                    },
                },
            },
        },
    },

    -- File search/Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        dependencies = {
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function() require('shragath.config.telescope') end,
    },

    { 'ThePrimeagen/harpoon' },
    {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup()
            vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Comment
    { 'numToStr/Comment.nvim',  event = "BufEnter", config = true },

    -- Add/change surrounds
    { 'kylechui/nvim-surround', event = "BufEnter", config = true },

    -- Undo tree history
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
        end
    },

    -- save as sudo
    { 'lambdalisue/suda.vim', cmd = "SudaWrite" },

    -- Git
    { 'tpope/vim-fugitive',   cmd = "Git" },
    { 'tpope/vim-rhubarb',    cmd = 'Git' },
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    { 'lewis6991/gitsigns.nvim', config = true },

    -- move motions
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end,
        event = "BufEnter"
    },
    {
        'folke/trouble.nvim',
        config = true,
        keys = { { '<Leader>tr', '<cmd>TroubleToggle<CR>', desc = 'Toggle trouble window' } },
    },

    -- Jupyter notebook support
    -- { 'dccsillag/magma-nvim',    build = ':UpdateRemotePlugins', ft = "python" },

    -- Latex support
    { 'lervag/vimtex',           ft = "tex" },
    {
        'barreiroleo/ltex_extra.nvim',
    },

    -- Emmet
    -- { 'mattn/emmet-vim',           ft = { "html", "js", "ts", "jsx", "tsx" } },

    -- Signature help
    { 'ray-x/lsp_signature.nvim',  config = true,         event = "InsertEnter" },

    -- Show Colors
    { 'NvChad/nvim-colorizer.lua', config = true,         event = "VeryLazy" },

    -- makes vim autocomplete (), [], {}, '', ----, etc
    -- matches pairs of things (if-else, tags, etc)
    { 'windwp/nvim-autopairs',     event = "InsertEnter", config = true },

    -- tmux
    {
        'christoomey/vim-tmux-navigator',
        keys = {
            { '<A-h>', '<CMD>NavigatorLeft<CR>',     desc = "Tmux pane navigator left" },
            { '<A-l>', '<CMD>NavigatorRight<CR>',    desc = "Tmux pane navigator right" },
            { '<A-k>', '<CMD>NavigatorUp<CR>',       desc = "Tmux pane navigator up" },
            { '<A-j>', '<CMD>NavigatorDown<CR>',     desc = "Tmux pane navigator down" },
            { '<A-p>', '<CMD>NavigatorPrevious<CR>', desc = "Tmux pane navigator previous" },
        }
    }
})
