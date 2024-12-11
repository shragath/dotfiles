return {
    {
        "folke/which-key.nvim",
        cmd = "WhichKey"
    },
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    {
        'nvim-lua/plenary.nvim',
        lazy = true
    },
    {
        'windwp/nvim-ts-autotag',
        config = true,
        event = "InsertEnter"
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    -- Debugging -- !ToDo()
    { 'mfussenegger/nvim-dap' },
    -- Comment
    {
        'numToStr/Comment.nvim',
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
    -- Show Colors
    { 'NvChad/nvim-colorizer.lua', config = true,         event = "VeryLazy" },
    -- makes vim autocomplete (), [], {}, '', ----, etc
    -- matches pairs of things (if-else, tags, etc)
    { 'windwp/nvim-autopairs',     event = "InsertEnter", config = true },

}
