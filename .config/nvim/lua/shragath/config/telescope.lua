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
