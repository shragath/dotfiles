-- LuaSnip
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-o>", function() ls.jump(1) end, { silent = true, desc = '[LuaSnip] Jump next' })

vim.keymap.set({ "i", "s" }, "<C-e>", function() ls.jump(-1) end, { silent = true, desc = '[LuaSnip] Jump prev' })
