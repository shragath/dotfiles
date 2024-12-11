require("rust-tools").setup({
    server = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    },
    tools = {
        inlay_hints = {
            auto = false
        }
    }
})
