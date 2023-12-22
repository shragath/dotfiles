require('lspconfig').ltex.setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        ltex = {
            language = "es",
            -- language = "en-US",
            disabledRules = {
                ["es"] = { 'PROFANITY' },
            },
            -- dictionary = {
            --     ["es"] = words
            -- }
        }
    }
})
