return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { icons = { mappings = false } },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "windwp/nvim-ts-autotag",
        config = true,
        event = "InsertEnter",
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    -- Comment
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = true,
    },
    -- Undo tree history
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
        end,
    },
    -- save as sudo
    {
        "lambdalisue/suda.vim",
        cmd = "SudaWrite",
    },
    -- Show Colors
    { "NvChad/nvim-colorizer.lua", config = true, event = "VeryLazy" },
    -- makes vim autocomplete (), [], {}, '', ----, etc
    -- matches pairs of things (if-else, tags, etc)
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
    { "nmac427/guess-indent.nvim", config = true },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
}
