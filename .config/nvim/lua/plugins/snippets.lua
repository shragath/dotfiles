-- Snippets
return {
    {
        'L3MON4D3/LuaSnip',
        version = "2.*",
        config = function() require('shragath.config.luasnip') end,
        build = "make install_jsregexp"
    },
    { 'rafamadriz/friendly-snippets' },
}
