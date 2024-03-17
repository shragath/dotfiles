return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<Space>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<Space>a", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<Space>s", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<Space>h", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<Space>t", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<Space>p", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<Space>n", function() harpoon:list():next() end)

        -- Harpoon
        -- vim.keymap.set('n', '<Space>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>', {
        --     noremap = true
        -- })
        --
        -- vim.keymap.set('n', '<Space>hm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', {
        --     noremap = true
        -- })
        --
        -- vim.keymap.set('n', '<Space>ht', '<cmd>lua require("harpoon.ui").nav_next()<cr>', {
        --     noremap = true
        -- })
        --
        -- vim.keymap.set('n', '<Space>hs', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', {
        --     noremap = true
        -- })
    end
}
