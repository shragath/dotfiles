-- move motions
return {
    'ggandor/leap.nvim',
    config = function()
        require('leap').add_default_mappings()
    end,
    event = "BufEnter"
}
