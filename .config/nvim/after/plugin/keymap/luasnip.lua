-- LuaSnip
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
        ls.choice_active(1)
    end
end, { silent = true })

