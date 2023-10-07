-----------------------------------------------------------
-- Latex
-----------------------------------------------------------
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.opt.spelllang = 'es'

require('cmp').setup.buffer {
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                gh_issues = "[issues]"
                -- formatting for other sources
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'omni' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        -- other sources
    },
}

