-- indentation guides
return {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    -- config = function() require('shragath.config.indent-blankline') end
    opts = {
        indent = { char = "╎" }, --"│"
        whitespace = { remove_blankline_trail = true },
        scope = { enabled = true, char = "┊", show_start = false },
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_trailing_blankline_indent = true,
        -- show_current_context_start = false,
        exclude = {
            filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        }
    }
}
