-- move motions
return {
    'ggandor/leap.nvim',
    config = function()
        vim.keymap.set({ 'n', 'x', 'o' }, '<Space>s', '<Plug>(leap-forward)')
        vim.keymap.set({ 'n', 'x', 'o' }, '<Space>S', '<Plug>(leap-backward)')
        vim.keymap.set({ 'n', 'x', 'o' }, '<Space>gs', '<Plug>(leap-from-window)')
    end,
}
