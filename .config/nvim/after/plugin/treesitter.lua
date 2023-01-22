-- TreeSitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "typescript", "rust", "python", "go", "javascript", "lua", "vim",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    auto_install = true,
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
    },
    -- indent = {
    --     enable = true
    -- },
    -- autotag = {
    --     enable = true
    -- },
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}
