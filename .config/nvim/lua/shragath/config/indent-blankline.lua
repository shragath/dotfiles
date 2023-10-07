vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("ibl").setup {
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
