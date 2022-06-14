require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"vendor", "node_modules"}
    },
    pickers = {
        find_files = {
            theme = "dropdown"
        }
    }
}

require("telescope").load_extension "file_browser"
