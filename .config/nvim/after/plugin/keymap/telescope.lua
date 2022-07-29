-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', {
    noremap = true
})
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {
    noremap = true
})
vim.keymap.set('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', {
    noremap = true
})
vim.keymap.set('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {
    noremap = true
})
vim.keymap.set({ "n" }, "<leader>fm", '<cmd>lua require("telescope.builtin").keymaps()<cr>', { silent = true })
-- Telescope session explorer
vim.keymap.set('n', '<Leader>fs', '<cmd>lua require("session-lens").search_session()<CR>', {
    noremap = true,
    silent = true
})
-- Telescope file explorer
vim.keymap.set('n', '<Space>ed', '<cmd>Telescope file_browser<CR>', {
    noremap = true,
    silent = true })

