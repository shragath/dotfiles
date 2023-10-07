-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
local buf_group = vim.api.nvim_create_augroup('bufcheck', { clear = true })

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    group    = buf_group,
    pattern  = '*',
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})

-- vim.api.nvim_create_autocmd('BufWritePost', {
--     group    = buf_group,
--     pattern  = '*',
--     callback = function() vim.cmd('TSDisable rainbow | TSEnable rainbow') end
-- })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#9ccfd8' })
vim.api.nvim_set_hl(0, 'LspInlayHint', { bg = '#011627', fg = '#727169' })

