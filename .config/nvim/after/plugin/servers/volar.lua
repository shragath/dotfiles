local tsserver_path = '/home/shragath/local/share/nvim/mason/bin'

require('lspconfig').volar.setup {
    init_options = {
        typescript = {
            tsdk = tsserver_path,
        }
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    filetypes = { 'typescript', 'javascript', 'vue', 'json' },
}
