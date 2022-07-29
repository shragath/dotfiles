-- Add comand C hlsearch
vim.api.nvim_command('command C let @/=""')

-- Search and replace word under cursor
vim.keymap.set('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { noremap = true })
-- Search word under cursor
vim.keymap.set('n', '<Leader>S', '/<C-r><C-w><cr>', { noremap = true })

-- Y yank until the end of line
vim.keymap.set('n', 'Y', 'y$', {
    noremap = true
})

-- Netrw file explorer
vim.keymap.set('n', '-', '<cmd>Explore<cr>', {
    noremap = true,
})

-- Deletes extra spaces at end of lines
vim.keymap.set('n', '<Space>ds', '<cmd>%s/\\s\\+$//e<CR>', {
    noremap = true,
    silent = true
})

-- Undo tree
vim.keymap.set('n', '<Leader>ut', '<cmd>UndotreeToggle<CR>', {
    noremap = true,
    silent = true
})

-- Terminal
vim.keymap.set('t', '<Space><esc>', '<C-\\><C-n>', {
    noremap = true
})

-- Opens terminal bottom
vim.keymap.set('n', '<S-t>', ':botright split | term<CR>', { noremap = true })

-- Add move line shortcuts
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==', {
    noremap = true
})
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==', {
    noremap = true
})
vim.keymap.set('i', '<A-j>', '<Esc><cmd>m .+1<CR>==gi', {
    noremap = true
})
vim.keymap.set('i', '<A-k>', '<Esc><cmd>m .-2<CR>==gi', {
    noremap = true
})
vim.keymap.set('v', '<A-j>', '<cmd>m \'>+1<CR>gv=gv', {
    noremap = true
})
vim.keymap.set('v', '<A-k>', '<cmd>m \'<-2<CR>gv=gv', {
    noremap = true
})

-- Move in quikfix list
vim.keymap.set('n', '<A-q>', '<cmd>copen<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<A-l>', '<cmd>cnext<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<A-h>', '<cmd>cprev<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<Space-j>', '<cmd>lnext<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<Space-k>', '<cmd>lprev<CR>', {
    noremap = true,
    silent = true
})

-- Hop
vim.keymap.set('n', '<Space>c', '<cmd>HopChar1<cr>', {
    noremap = true
})
vim.keymap.set('v', '<Space>c', '<cmd>HopChar1<cr>', {
    noremap = true
})
vim.keymap.set('n', '<Space>s', '<cmd>HopChar2<cr>', {
    noremap = true
})
vim.keymap.set('v', '<Space>s', '<cmd>HopChar2<cr>', {
    noremap = true
})
vim.keymap.set('n', '<Space>w', '<cmd>HopPattern<cr>', {
    noremap = true
})
vim.keymap.set('n', '<Space>l', '<cmd>HopLine<cr>', {
    noremap = true
})
vim.keymap.set('n', '<A-w>', '<cmd>HopWord<cr>', {
    noremap = true
})
vim.keymap.set('v', '<A-w>', '<cmd>HopWord<cr>', {
    noremap = true
})

-- Buffers
-- Move to previous/next
vim.keymap.set('n', '<S-h>', '<cmd>BufferPrevious<CR>', {
    noremap = true
})
vim.keymap.set('n', '<S-l>', '<cmd>BufferNext<CR>', {
    noremap = true
})

-- Close buffer
vim.keymap.set('n', '<A-c>', '<cmd>BufferClose<CR>', {
    noremap = true
})

-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<cmd>BufferGoto 1<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-2>', '<cmd>BufferGoto 2<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-3>', '<cmd>BufferGoto 3<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-4>', '<cmd>BufferGoto 4<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-5>', '<cmd>BufferGoto 5<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-6>', '<cmd>BufferGoto 6<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-7>', '<cmd>BufferGoto 7<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-8>', '<cmd>BufferGoto 8<CR>', {
    noremap = true
})
vim.keymap.set('n', '<A-9>', '<cmd>BufferLast<CR>', {
    noremap = true
})

-- Magic buffer-picking mode
vim.keymap.set('n', '<C-s>', '<cmd>BufferPick<CR>', {
    noremap = true
})

-- Use <Tab> and <S-Tab> to navigate through popup menu
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {
--     noremap = true,
--     expr = true
-- })
-- vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {
--     noremap = true,
--     expr = true
-- })

-- Harpoon
vim.keymap.set('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>', {
    noremap = true
})

vim.keymap.set('n', '<leader>hm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', {
    noremap = true
})

-- Change working directory to the location of the current file
vim.keymap.set('n', '<leader>cd', "<cmd>cd %:p:h<CR><cmd>pwd<CR>")
