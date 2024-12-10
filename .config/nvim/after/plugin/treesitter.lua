-- TreeSitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "vimdoc", "typescript", "rust", "python", "go", "javascript", "lua", "vim", "html", "css", "java"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    auto_install = true,
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
    -- rainbow = {
    --     enable = true,
    --     -- list of languages you want to disable the plugin for
    --     disable = { 'jsx', 'cpp', 'tsx' },
    --     -- Which query to use for finding delimiters
    --     query = 'rainbow-parens',
    --         -- html = 'rainbow-tags',
    --         -- tsx = 'rainbow-tags',
    --     -- Highlight the entire buffer all at once
    --     strategy = require('ts-rainbow').strategy.global,
    -- },
    indent = {
        enable = true,
        -- disable = { 'tsx' },
    },
    -- autotag = {
    --     enable = true
    -- },
    -- textsubjects = {
    --     enable = true,
    --     prev_selection = ',', -- (Optional) keymap to select the previous selection
    --     keymaps = {
    --         ['.'] = 'textsubjects-smart',
    --         [';'] = 'textsubjects-container-outer',
    --         ['i;'] = 'textsubjects-container-inner',
    --     },
    -- },
}
