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
            theme = "dropdown"
        }
    }
}

require("telescope").load_extension("ui-select")
require('telescope').load_extension('fzf')
