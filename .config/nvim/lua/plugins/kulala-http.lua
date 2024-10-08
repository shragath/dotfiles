-- Make http requests from within neovim
return {
    'mistweaverco/kulala.nvim',
    require('lazy').setup({
        -- HTTP REST-Client Interface
        config = function()
            require('kulala').setup({
                -- default_view, body or headers
                default_view = "body",
                -- dev, test, prod, can be anything
                -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
                default_env = "dev",
                -- enable/disable debug mode
                debug = false,
            })
        end
    })
}
