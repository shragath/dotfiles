-- Add comand C hlsearch
vim.api.nvim_command('command C let @/=""')
vim.api.nvim_command('command BufOnly :w|%bd|e#')

-- Search and replace word under cursor
vim.keymap.set('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { noremap = true })

-- Escape with Control + c
vim.keymap.set('i', '<C-c>', '<Esc>', { noremap = true })

-- greatest remap ever
vim.keymap.set('x', '<leader>p', '\"_dP')

-- Center view
vim.keymap.set('n', '<C-d>', '<C-d>zz', {
    noremap = true
})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {
    noremap = true
})
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Trouble
vim.keymap.set({ 'n', 'i' }, '<leader>tr', '<cmd>TroubleToggle<CR>', {
    noremap = true,
    silent = true
})

-- Deletes extra spaces at end of lines
vim.keymap.set('n', '<Space>ds', ':%s/\\s\\+$//e<CR>', {
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
vim.keymap.set({ 'n', 't' }, '<c-\\>', '<cmd>ToggleTerm size=20 direction=horizontal<cr>')

-- Opens terminal bottom
vim.keymap.set('n', '<Space-t>', ':left split | term<CR>', { noremap = true })

-- Add move line shortcuts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

-- Buffers
-- Move to previous/next
vim.keymap.set('n', '<S-h>', '<cmd>bprev<CR>', {
    noremap = true
})
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', {
    noremap = true
})

-- Close buffer
vim.keymap.set('n', '<A-c>', '<cmd>bdelete %<CR>', {
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
vim.keymap.set('n', '<Space>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>', {
    noremap = true
})

vim.keymap.set('n', '<Space>hm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', {
    noremap = true
})

vim.keymap.set( 'n', '<Space>ht', '<cmd>lua require("harpoon.ui").nav_next()<cr>', {
    noremap = true
})

vim.keymap.set('n', '<Space>hs', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', {
    noremap = true
})
-- Change working directory to the location of the current file
vim.keymap.set('n', '<leader>cd', "<cmd>cd %:p:h<CR><cmd>pwd<CR>")
