require('shragath.config')
require('shragath.lazy')

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
local r_group = vim.api.nvim_create_augroup("RustAU", { clear = true })
local csharp_group = vim.api.nvim_create_augroup("csharpAU", { clear = true })
local py_group = vim.api.nvim_create_augroup("PythonAU", { clear = true })
local buf_group = vim.api.nvim_create_augroup('bufcheck', { clear = true })

local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd("FileType", { pattern = "rust", callback = function()
    vim.keymap.set({ 'n', 'i' }, '<F10>', '<cmd>TermExec cmd="cargo test" size=60<cr>')
    vim.keymap.set({ 'n', 'i' }, '<F9>', '<cmd>TermExec cmd="cargo run" size=60<cr>')
    vim.keymap.set('n', '<F11>', '<cmd>TermExec cmd="cargo run --bin %:t:r"  size=60<cr>')
    vim.keymap.set('n', '<Leader>hu', '<cmd>lua require("rust-tools").inlay_hints.unset()<cr>')
end, group = r_group })

vim.api.nvim_create_autocmd("FileType", { pattern = "cs", callback = function()
    vim.keymap.set('i', '<F9>', '<cmd>TermExec cmd="dotnet run" size=60<cr>')
    vim.keymap.set('n', '<F9>', '<cmd>TermExec cmd="dotnet run" size=60<cr>')
end, group = csharp_group })

vim.api.nvim_create_autocmd("FileType", { pattern = "python", callback = function()
    vim.keymap.set('i', '<F9>', '<cmd>TermExec cmd="python3 %" size=60<cr>')
    vim.keymap.set('n', '<F9>', '<cmd>TermExec cmd="python3 %" size=60<cr>')
    vim.keymap.set('n', '<leader>r', '<cmd>MagmaEvaluateOperator<cr>')
    vim.keymap.set('n', '<leader>rr', '<cmd>MagmaEvaluateLine<cr>')
    vim.keymap.set('v', '<leader>r', ':<C-u>MagmaEvaluateVisual<cr>')
    vim.keymap.set('n', '<leader>rc', '<cmd>MagmaReevaluateCell<cr>')
    vim.keymap.set('n', '<leader>rd', '<cmd>MagmaDelete<cr>')
    vim.keymap.set('n', '<leader>ro', '<cmd>MagmaShowOutput<cr>')
    vim.g.magma_automatically_open_output = false
    vim.g.magma_image_provider = 'ueberzug'
    -- vim.cmd('PackerLoad magma-nvim')
end, group = py_group })

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    group    = buf_group,
    pattern  = '*',
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})

vim.api.nvim_create_autocmd('BufWritePost', {
    group    = buf_group,
    pattern  = '*',
    callback = function() vim.cmd('TSDisable rainbow | TSEnable rainbow') end
})
