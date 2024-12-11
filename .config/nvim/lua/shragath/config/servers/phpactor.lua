require('lspconfig').phpactor.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}
