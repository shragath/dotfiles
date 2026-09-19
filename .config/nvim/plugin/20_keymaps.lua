-- Add comand C hlsearch
vim.api.nvim_command('command BufOnly :%bdelete|edit #|normal`"')

vim.keymap.set(
    "n",
    "<Leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    { noremap = true, desc = "Search and replace word under cursor" }
)

--
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, desc = "Escape with Control + c" })

vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, desc = "Keeps pasted text in registry" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Keeps text in register after deleting"})

-- Center view
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    noremap = true,
    desc = "Center view when scrolling down",
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    noremap = true,
    desc = "Center view when scrolling up",
})

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')


vim.keymap.set("n", "<Space>ds", ":%s/\\s\\+$//e<CR>", {
    noremap = true,
    silent = true,
    desc = "Deletes extra spaces at end of lines",
})

-- Add move line shortcuts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

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
vim.keymap.set("n", "<A-q>", toggle_quickfix, {
    noremap = true,
    silent = true,
    desc = "Opens quick fix list",
})

vim.keymap.set("n", "<A-l>", "<cmd>cnext<CR>", {
    noremap = true,
    silent = true,
    desc = "Move to next in quick fix list",
})

vim.keymap.set("n", "<A-h>", "<cmd>cprev<CR>", {
    noremap = true,
    silent = true,
    desc = "Move to previous in quick fix list",
})

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", {
    noremap = true,
    desc = "Move to previous buffer",
})
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", {
    noremap = true,
    desc = "Move to next buffer",
})

vim.keymap.set("n", "<A-c>", "<cmd>bdelete %<CR>", {
    noremap = true,
    desc = "Close buffer",
})

vim.keymap.set(
    "n",
    "<leader>cd",
    "<cmd>cd %:p:h<CR><cmd>pwd<CR>",
    { desc = "Change working directory to the location of the current file" }
)

local function toggle(option)
    local value = vim.api.nvim_get_option_value(option, { scope = "local" })
    vim.api.nvim_set_option_value(option, not value, { scope = "local" })
    vim.notify((not value and "  " or "no") .. option, vim.log.levels.INFO)
end

vim.keymap.set("n", "<Space>1", function()
    toggle("spell")
end, { desc = "Toggle option 'spell'" })

-- LuaSnip
-- local ls = require("luasnip")
-- vim.keymap.set({ "i", "s" }, "<C-o>", function()
--     ls.jump(1)
-- end, { silent = true, desc = "[LuaSnip] Jump next" })
--
-- vim.keymap.set({ "i", "s" }, "<C-e>", function()
--     ls.jump(-1)
-- end, { silent = true, desc = "[LuaSnip] Jump prev" })

