require('telescope').setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
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

require("telescope").load_extension "file_browser"
require("telescope").load_extension("ui-select")
