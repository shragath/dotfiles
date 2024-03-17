return {
    { "folke/which-key.nvim", cmd = "WhichKey" },
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    'nvim-lua/plenary.nvim',
    --  "ziontee113/syntax-tree-surfer"
    { 'windwp/nvim-ts-autotag',                      config = true },

    -- indentation guides
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     event = { "BufReadPost", "BufNewFile" },
    --     main = "ibl",
    --     config = function() require('shragath.config.indent-blankline') end
    -- }, --
    -- Inlay hints
    -- { 'lvimuser/lsp-inlayhints.nvim',     config = true,         branch = "anticonceal" },
    -- Diagnostics
    -- { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     "jayp0521/mason-null-ls.nvim",
    -- },
    { 'simrat39/rust-tools.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    'jose-elias-alvarez/typescript.nvim',

    -- Debugging -- !ToDo()
    { 'mfussenegger/nvim-dap' },

    { 'onsails/lspkind-nvim' },

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
    { 'lambdalisue/suda.vim',    cmd = "SudaWrite" },


    { 'lewis6991/gitsigns.nvim', config = true },


    -- Jupyter notebook support
    -- { 'dccsillag/magma-nvim',    build = ':UpdateRemotePlugins', ft = "python" },

    -- Latex support
    { 'lervag/vimtex',             ft = "tex" },
    {
        'barreiroleo/ltex_extra.nvim',
    },

    -- Signature help
    { 'ray-x/lsp_signature.nvim',  config = true,         event = "InsertEnter" },

    -- Show Colors
    { 'NvChad/nvim-colorizer.lua', config = true,         event = "VeryLazy" },

    -- makes vim autocomplete (), [], {}, '', ----, etc
    -- matches pairs of things (if-else, tags, etc)
    { 'windwp/nvim-autopairs',     event = "InsertEnter", config = true },

}
