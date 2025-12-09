-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
local buf_group = vim.api.nvim_create_augroup('bufcheck', { clear = true })

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    desc     = 'Highlight when yankingg (copying) text',
    group    = buf_group,
    pattern  = '*',
    callback = function() vim.hl.on_yank() end
})

