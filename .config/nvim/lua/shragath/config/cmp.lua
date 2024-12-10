-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local luasnip = require("luasnip")
local lspkind = require('lspkind')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')


-- Setup nvim-cmp.
local cmp = require 'cmp'

local mapping = {
    ['<C-[>'] = cmp.mapping.scroll_docs(4),
    ['<C-]>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
    }, { "i", "c" }),
    ["<C-q>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, { "i", "s" })
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = mapping,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer',                 keyword_length = 5 },
        { name = 'path' },
        { name = 'emoji' },
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            maxwidth = 50,
            ellipsis_char = '...',
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                gh_issues = "[issues]",
                nvim_lsp_signature_help = "[sig]",
            }
        }
    },
    experimental = {
        native_menu = false,
        -- ghost_text = false
    }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
        { name = 'buffer' }
    })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
