local opts = { remap = true, silent = true }

vim.keymap.set({ 'n', 'i' }, '<C>-', function()
    vim.cmd("silent !tmux send -t 1 'dotnet run' Enter")
end, opts)
