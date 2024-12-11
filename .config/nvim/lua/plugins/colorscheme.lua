-- Themes
return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.cursorline = true
        require('kanagawa').setup({
            theme = "wave",
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            colors = {
                theme = {
                    wave = {
                        ui = {
                            bg        = '#011627',
                            -- bg_dim = '#011627',
                            bg_gutter = '#011627',
                        },
                        diag = {
                            error = '#ebbcba', -- extended color 1
                        },
                    }
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    -- NormalFloat = { bg = "none" },
                    -- FloatBorder = { bg = "none" },
                    -- FloatTitle = { bg = "none" },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where your still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    --
                    -- CursorLineNr & CursorLine colors
                    cursorline = { bg = 'none' },
                    CursorLineNr = { fg = '#9ccfd8' },
                    LspInlayHint = { bg = '#011627', fg = '#727169' },
                    IncSearch = { bg = '#536878', fg = '#16161D' },
                }
            end,
        })

        vim.cmd.colorscheme('kanagawa')
        vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#536878', fg = '#16161D' })
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#9ccfd8' })
        vim.api.nvim_set_hl(0, 'LspInlayHint', { bg = '#011627', fg = '#727169' })
    end
}
