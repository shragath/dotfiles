-- File explorer
return {
    'stevearc/oil.nvim',
    config = true,
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
