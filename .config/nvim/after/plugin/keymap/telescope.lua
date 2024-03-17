local telescope = require('telescope.builtin')
-- Telescope
vim.keymap.set('n', '<leader>fr', function() telescope.resume() end, {
    noremap = true,
    desc = 'Find resume'
})
vim.keymap.set('n', '<leader>ff', function() telescope.find_files() end, {
    noremap = true,
    desc = 'Find files'
})
vim.keymap.set('n', '<leader>fg', function() telescope.live_grep() end, {
    noremap = true,
    desc = 'Live grep'
})
vim.keymap.set('n', '<leader>fb', function() telescope.buffers() end, {
    noremap = true,
    desc = 'Show buffers'
})
vim.keymap.set('n', '<leader>fh', function() telescope.help_tags() end, {
    noremap = true,
    desc = 'Help tags'
})
vim.keymap.set({ "n" }, "<leader>fm", function() telescope.keymaps() end, {
    silent = true,
    desc = 'List keymaps'
})
vim.keymap.set({ "n" }, "<leader>fl", function() telescope.current_buffer_fuzzy_find() end,
    {
        silent = true,
        desc = 'Current buffer fuzzy find'
    }
)
