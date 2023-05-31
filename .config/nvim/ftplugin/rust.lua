local opts = { noremap = true, silent = true }

vim.keymap.set({ 'n', 'i' }, '<Leader>0', function()
    vim.cmd("stopinsert")
    vim.cmd("silent !tmux send -t 0 'cargo test' Enter")
end, opts)

vim.keymap.set({ 'n', 'i' }, '<Leader>-', function()
    vim.cmd("stopinsert")
    vim.cmd("silent !tmux send -t 0 'cargo run' Enter")
end, opts)

vim.keymap.set({ 'n', 'i' }, '<Leader>=', function()
    vim.cmd("stopinsert")
    vim.cmd("silent ! tmux send -t 0 'cargo run --bin %:t:r' Enter")
end, opts)
