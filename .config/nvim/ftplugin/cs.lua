local opts = { remap = true, silent = true }

vim.keymap.set({ 'n', 'i' }, '<Leader>0', function()
    vim.cmd("silent !tmux send -t 0 'dotnet run' Enter")
end, { desc = "Dotnet run" }, opts)
