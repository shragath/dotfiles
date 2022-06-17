if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
  return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    --  You can jump back into it even if you move outside of the slection
    history = true,

    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippet
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            }
        }
    }
}

require 'config.luasnip.snippets'
