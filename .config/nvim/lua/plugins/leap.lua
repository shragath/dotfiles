-- move motions
return {
    'ggandor/leap.nvim',
    config = function()
        local clever_s = require('leap.user').with_traversal_keys('s', 'S')
        vim.keymap.set({ 'n', 'x', 'o' }, 's', function ()
            require('leap').leap { opts = clever_s }
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, 'S', function ()
            require('leap').leap { opts = clever_s, backward = true }
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, '<Space>gs', '<Plug>(leap-from-window)')
    end,
}
