-- File search/Fuzzy Finder
return {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = {
        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }

                }
            },
            defaults = {
                file_ignore_patterns = { "vendor", "node_modules" }
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                    previewer = false,
                    -- find_command = { "rg", "--ignore", "--hidden", "--files" }
                },
                current_buffer_fuzzy_find = {
                    theme = "cursor",
                    previewer = false,
                },
            }
        }

        require("telescope").load_extension("ui-select")
        require('telescope').load_extension('fzf')
    end,
}
