---- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- require("lsp-inlayhints").on_attach(client, ev.buf)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.name == "tsserver" or client.name == "eslint" or client.name == "volar" then
            client.server_capabilities.documentFormattingProvider = false             -- 0.8 and later
        end
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>f', function()
            -- vim.lsp.buf.format { async = true }
            require("conform").format({ async = true, lsp_fallback = true, range = range })
        end, opts)

        -- Custom :lua =vim.lsp.get_active_clients()[1].server_capabilities
        if client.server_capabilities.inlayHintProvider ~= nil and client.server_capabilities.inlayHintProvider ~= false then
            -- if client.server_capabilities.inlayHintProvider.resolveProvider then
            vim.g.inlay_hints_visible = true
            -- vim.lsp.inlay_hint(ev.buf, true)
            vim.keymap.set('n', '<leader>ih', function()
                vim.lsp.inlay_hint.enable(ev.buf, not vim.lsp.inlay_hint.is_enabled(ev.buf))
            end, { buffer = ev.buf, desc = "Toggle inlay hints" })
            -- end
        end
        if client.name == 'omnisharp' then
            local function toSnakeCase(str)
                return string.gsub(str, "%s*[- ]%s*", "_")
            end
            local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
            for i, v in ipairs(tokenModifiers) do
                tokenModifiers[i] = toSnakeCase(v)
            end
            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
            for i, v in ipairs(tokenTypes) do
                tokenTypes[i] = toSnakeCase(v)
            end
        end
        if client.name == 'ltex' then
            require("ltex_extra").setup {
                load_langs = { "es", "en" },
                path = "spell",
            }
        end
    end,
})             --
