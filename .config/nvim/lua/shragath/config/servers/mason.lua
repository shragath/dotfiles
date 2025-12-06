local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "pylsp", "intelephense", "vimls", "gopls", "cssls", "tailwindcss",
        "bashls", "omnisharp", "r_language_server", "lua_ls", "rust_analyzer", "texlab", 
        "prettier", "prettierd"
    }
})
-- Remove from list
local installed_servers = require('mason-lspconfig').get_installed_servers()
local skip_servers = {
    'rust_analyzer', 'lua_ls', 'ltex', 'ts_ls', 'vtsls', 'omnisharp_mono',
    'intelephense', 'jdtls', 'volar'
}
for i, server_name in ipairs(installed_servers) do
    for j, server in ipairs(skip_servers) do
        if server_name == server then
            table.remove(installed_servers, i)
            table.remove(skip_servers, j)
        end
    end
end

for _, server_name in ipairs(installed_servers) do
    lspconfig[server_name].setup({
        capabilities = lsp_capabilities,
    })
end
