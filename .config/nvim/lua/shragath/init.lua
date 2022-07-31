require('shragath.config')
require('shragath.plugins')

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
local r_group = vim.api.nvim_create_augroup("RustAU", { clear = true })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", callback = function()
    vim.keymap.set('i', '<F9>', '<esc><cmd>w<cr><cmd>exec "!cargo run"<cr>')
    vim.keymap.set('n', '<F9>', '<cmd>w<cr><cmd>exec "!cargo run"<cr>')
    vim.keymap.set('n', '<F10>', '<cmd>w<cr><cmd>exec "!cargo run --bin" expand("%:t:r")<cr>')
    vim.keymap.set('n', '<Leader>hi', '<cmd>lua require("rust-tools.inlay_hints").toggle_inlay_hints()<cr>')
end, group = r_group })
-- vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "rs", callback = function()
--     require('rust-tools.inlay_hints').toggle_inlay_hints()
-- end, group = r_group })
