local opts = { remap = true, silent = true }

vim.keymap.set({ 'n', 'i' }, '<Leader>-', function()
    vim.cmd("silent !tmux send -t 1 'python3 %' Enter")
end, opts)
vim.keymap.set('n', '<leader>r', '<cmd>MagmaEvaluateOperator<cr>')
vim.keymap.set('n', '<leader>rr', '<cmd>MagmaEvaluateLine<cr>')
vim.keymap.set('v', '<leader>r', ':<C-u>MagmaEvaluateVisual<cr>')
vim.keymap.set('n', '<leader>rc', '<cmd>MagmaReevaluateCell<cr>')
vim.keymap.set('n', '<leader>rd', '<cmd>MagmaDelete<cr>')
vim.keymap.set('n', '<leader>ro', '<cmd>MagmaShowOutput<cr>')
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = 'ueberzug'
