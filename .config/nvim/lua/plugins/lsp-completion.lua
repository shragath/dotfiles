-- Autocompletion
return {
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
    -- AI autocolmpletion
    {
        "jcdickinson/codeium.nvim",
        config = function()
            require("codeium").setup({})
        end
    },
}
