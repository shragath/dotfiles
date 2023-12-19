local opts = { remap = true, silent = true }

vim.keymap.set({ 'i', 'n' }, '<C>-', function()
    vim.cmd("silent !tmux send -t 1 'Rscript %' Enter")
end, opts)
