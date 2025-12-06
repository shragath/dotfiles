-- Add comand C hlsearch
vim.api.nvim_command('command BufOnly :%bdelete|edit #|normal`"')

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

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Deletes extra spaces at end of lines
vim.keymap.set('n', '<Space>ds', ':%s/\\s\\+$//e<CR>', {
    noremap = true,
    silent = true
})

-- Terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', {
    noremap = true
})

-- Add move line shortcuts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose() -- Close the quickfix window if it's open
      return
    end
  end
  -- Open the quickfix window if it's not open and there are items in the list
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  end
end
-- Move in quikfix list
vim.keymap.set('n', '<A-q>', toggle_quickfix, {
    noremap = true,
    silent = true,
    desc = 'Opens quick fix list'
})

vim.keymap.set('n', '<A-l>', '<cmd>cnext<CR>', {
    noremap = true,
    silent = true,
    desc = 'Move to next in quick fix list'
})

vim.keymap.set('n', '<A->>', '<cmd>cprev<CR>', {
    noremap = true,
    silent = true,
    desc = 'Move to previous in quick fix list'
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


-- Change working directory to the location of the current file
vim.keymap.set('n', '<leader>cd', "<cmd>cd %:p:h<CR><cmd>pwd<CR>")

local function toggle(option)
    local value = vim.api.nvim_get_option_value(option, { scope = "local" })
    vim.api.nvim_set_option_value(option, not value, { scope = "local" })
    vim.notify((not value and "  " or "no") .. option, vim.log.levels.INFO)
end

vim.keymap.set("n", "<Space>1", function() toggle("spell") end, { desc = "Toggle option 'spell'" })


