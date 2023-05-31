vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    char = '╎', --"│",
    space_char_blankline = " ",
    show_current_context = false,
    show_trailing_blankline_indent = false,
    show_current_context_start = false,
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
}
