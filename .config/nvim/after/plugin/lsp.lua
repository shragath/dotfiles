local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
    -- disable lsp watcher. Too slow on linux
    wf._watchfunc = function()
        return function() end
    end
end
require('neodev').setup()
local lspconfig = require('lspconfig')
local configs = require 'lspconfig/configs'
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "pylsp", "intelephense", "vimls", "gopls", "cssls", "tailwindcss",
        "bashls", "omnisharp", "r_language_server", "lua_ls", "rust_analyzer", "tsserver", "texlab"
    }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

---- Mappings.{{{
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
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        -- require("lsp-inlayhints").on_attach(client, ev.buf)
        if client.name == "tsserver" or client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
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
            vim.lsp.buf.format { async = true }
        end, opts)

        -- Custom :lua =vim.lsp.get_active_clients()[1].server_capabilities
        if client.server_capabilities.inlayHintProvider ~= nil and client.server_capabilities.inlayHintProvider ~= false then
            -- if client.server_capabilities.inlayHintProvider.resolveProvider then
            vim.lsp.inlay_hint(ev.buf, true)
            vim.keymap.set('n', '<leader>ih', function()
                vim.lsp.inlay_hint(ev.buf)
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
    end,
}) -- }}}


-- Remove from list
local installed_servers = require('mason-lspconfig').get_installed_servers()
local skip_servers = { 'rust_analyzer', 'lua_ls', 'ltex', 'tsserver', 'vtsls', 'omnisharp_mono' }
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

local rt = require("rust-tools")

rt.setup({
    server = {
        capabilities = lsp_capabilities,
    },
    tools = {
        inlay_hints = {
            auto = false
        }
    }
})

lspconfig.lua_ls.setup { -- {{{
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            hint = {
                enable = true
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },

} -- }}}

lspconfig.ltex.setup({
    capabilities = lsp_capabilities,
    on_attach = function()
        require("ltex_extra").setup {
            load_langs = { "es" },
            path = "spell",
        }
    end,
    settings = {
        ltex = {
            language = "es",
            disabledRules = {
                ["es"] = { 'PROFANITY' },
            },
            -- dictionary = {
            --     ["es"] = words
            -- }
        }
    }
})

lspconfig.tsserver.setup({
    capabilities = lsp_capabilities,
    settings = {
        documentformatting = false,
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        }
    }
})

local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    -- ..., -- add to your other sources
    require("typescript.extensions.null-ls.code-actions"),
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}

require("mason-null-ls").setup({
    -- automatic_setup = true,
    ensure_installed = nil,
    automatic_installation = false,
    handlers = {
        function() end,
        prettierd = function()
            null_ls.register(null_ls.builtins.formatting.prettier)
        end,
    }
})

null_ls.setup({
    sources = sources,
    -- on_attach = function(client, bufnr)
    --     local bufopts = { noremap = true, silent = true, buffer = bufnr }
    --     if client.server_capabilities.documentFormattingProvider then
    --         vim.keymap.set({ 'n', 'v' }, '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    --     end
    -- end,
})
