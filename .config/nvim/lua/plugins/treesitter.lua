-- nvim-treesitter
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
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
                indent = {
                    enable = true,
                },
            }
        end
    },
    { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
    'nvim-treesitter/nvim-treesitter-context',
}
