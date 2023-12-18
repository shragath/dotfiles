-- Notes
return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
        load = {
            ["core.defaults"] = {},      -- Loads default behaviour
            ["core.concealer"] = {},     -- Adds pretty icons to your documents
            ["core.dirman"] = {          -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/Documents/notes",
                        tesis = "~/Documents/notes/tesis",
                        dev = "~/Documents/notes/dev"
                    },
                },
            },
        },
    },
}
