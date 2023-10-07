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
        { name = "codeium" },
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
                codeium = "[AI]",
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                gh_issues = "[issues]"
            }
        }
    },
    experimental = {
        native_menu = false,
        ghost_text = false
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

-- vim.cmd [[
-- highlight! CmpItemAbbrMatch guibg=NONE guifg=#7fdbca
-- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#7fdbca
-- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--
-- highlight! CmpItemKindEnum          guibg=NONE guifg=#7D8471
-- highlight! CmpItemKindInterface     guibg=NONE guifg=#252850
-- highlight! CmpItemKindFile          guibg=NONE guifg=#015D52
-- highlight! CmpItemKindText          guibg=NONE guifg=#781F19
-- highlight! CmpItemKindUnit          guibg=NONE guifg=#6C6874
-- highlight! CmpItemKindClass         guibg=NONE guifg=#282828
-- highlight! CmpItemKindColor         guibg=NONE guifg=#587246
-- highlight! CmpItemKindEvent         guibg=NONE guifg=#6C7059
-- highlight! CmpItemKindField         guibg=NONE guifg=#6F4F28
-- highlight! CmpItemKindValue         guibg=NONE guifg=#E7EBDA
-- highlight! CmpItemKindFolder        guibg=NONE guifg=#F3DA0B
-- highlight! CmpItemKindMethod        guibg=NONE guifg=#1E1E1E
-- highlight! CmpItemKindModule        guibg=NONE guifg=#CFD3CD
-- highlight! CmpItemKindStruct        guibg=NONE guifg=#A18594
-- highlight! CmpItemKindDefault       guibg=NONE guifg=#4C9141
-- highlight! CmpItemKindKeyword       guibg=NONE guifg=#CB3234
-- highlight! CmpItemKindSnippet       guibg=NONE guifg=#4E5754
-- highlight! CmpItemKindConstant      guibg=NONE guifg=#FF7514
-- highlight! CmpItemKindFunction      guibg=NONE guifg=#025669
-- highlight! CmpItemKindOperator      guibg=NONE guifg=#686C5E
-- highlight! CmpItemKindProperty      guibg=NONE guifg=#F4F4F4
-- highlight! CmpItemKindVariable      guibg=NONE guifg=#6D3F5B
-- highlight! CmpItemKindReference     guibg=NONE guifg=#474B4E
-- highlight! CmpItemKindEnumMember    guibg=NONE guifg=#193737
--
-- highlight! CmpItemKindEnumDefault          guibg=NONE guifg=#7D8471
-- highlight! CmpItemKindInterfaceDefault     guibg=NONE guifg=#252850
-- highlight! CmpItemKindFileDefault          guibg=NONE guifg=#015D52
-- highlight! CmpItemKindTextDefault          guibg=NONE guifg=#781F19
-- highlight! CmpItemKindUnitDefault          guibg=NONE guifg=#6C6874
-- highlight! CmpItemKindClassDefault         guibg=NONE guifg=#282828
-- highlight! CmpItemKindColorDefault         guibg=NONE guifg=#587246
-- highlight! CmpItemKindEventDefault         guibg=NONE guifg=#6C7059
-- highlight! CmpItemKindFieldDefault         guibg=NONE guifg=#6F4F28
-- highlight! CmpItemKindValueDefault         guibg=NONE guifg=#E7EBDA
-- highlight! CmpItemKindFolderDefault        guibg=NONE guifg=#F3DA0B
-- highlight! CmpItemKindMethodDefault        guibg=NONE guifg=#1E1E1E
-- highlight! CmpItemKindModuleDefault        guibg=NONE guifg=#CFD3CD
-- highlight! CmpItemKindStructDefault        guibg=NONE guifg=#A18594
-- highlight! CmpItemKindDefaultDefault       guibg=NONE guifg=#4C9141
-- highlight! CmpItemKindKeywordDefault       guibg=NONE guifg=#CB3234
-- highlight! CmpItemKindSnippetDefault       guibg=NONE guifg=#4E5754
-- highlight! CmpItemKindConstantDefault      guibg=NONE guifg=#FF7514
-- highlight! CmpItemKindFunctionDefault      guibg=NONE guifg=#025669
-- highlight! CmpItemKindOperatorDefault      guibg=NONE guifg=#686C5E
-- highlight! CmpItemKindPropertyDefault      guibg=NONE guifg=#F4F4F4
-- highlight! CmpItemKindVariableDefault      guibg=NONE guifg=#6D3F5B
-- highlight! CmpItemKindReferenceDefault     guibg=NONE guifg=#474B4E
-- highlight! CmpItemKindEnumMemberDefault    guibg=NONE guifg=#193737
-- ]]
