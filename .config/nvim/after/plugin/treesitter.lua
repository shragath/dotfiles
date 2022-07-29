-- TreeSitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "typescript", "rust", "python", "css", "go", "html", "javascript", "json", "lua", "php", "regex", "scss", "tsx", "vim", "vue", "yaml", "latex" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "ruby" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "ruby" } -- list of language that will be disabled
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
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

