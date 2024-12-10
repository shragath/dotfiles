-- Autocompletion
return {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { 'nvim-telescope/telescope-symbols.nvim' },
    {
        'yioneko/nvim-cmp',
        branch = 'perf-up',
        config = function()
            require('shragath.config.cmp')
        end
    },
    -- AI autocolmpletion
    {
        "monkoose/neocodeium",
        event = "VeryLazy",
        config = function()
            local neocodeium = require("neocodeium")
            neocodeium.setup()
            vim.keymap.set("i", "<A-y>", neocodeium.accept)
            vim.keymap.set("i", "<A-Y>", function()
                require("neocodeium").accept_line()
            end)
        end,
    },
}
