return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<Space>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<Space>a", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<Space>s", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<Space>h", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<Space>t", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<Space>p", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<Space>n", function() harpoon:list():next() end)
    end
}
