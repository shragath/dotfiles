return {
    {
        "folke/which-key.nvim",
        cmd = "WhichKey"
    },
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    {
        'nvim-lua/plenary.nvim',
        lazy = true
    },
    --  "ziontee113/syntax-tree-surfer"
    {
        'windwp/nvim-ts-autotag',
        config = true,
        event = "InsertEnter"
    },
    { 'simrat39/rust-tools.nvim' },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'jose-elias-alvarez/typescript.nvim' },
    -- Debugging -- !ToDo()
    { 'mfussenegger/nvim-dap' },
    -- Comment
    {
        'numToStr/Comment.nvim',
        event = "BufEnter",
        config = true
    },
    -- Add/change surrounds
    {
        'kylechui/nvim-surround',
        event = "BufEnter",
        config = true
    },
    -- Undo tree history
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
        end
    },
    -- save as sudo
    {
        'lambdalisue/suda.vim',
        cmd = "SudaWrite"
    },

    {
        'lewis6991/gitsigns.nvim',
        config = true
    },
    {
        'lervag/vimtex',
        ft = "tex"
    },
    {
        'barreiroleo/ltex_extra.nvim',
        ft = "tex",
    },
    -- Show Colors
    { 'NvChad/nvim-colorizer.lua', config = true,         event = "VeryLazy" },
    -- makes vim autocomplete (), [], {}, '', ----, etc
    -- matches pairs of things (if-else, tags, etc)
    { 'windwp/nvim-autopairs',     event = "InsertEnter", config = true },

}
