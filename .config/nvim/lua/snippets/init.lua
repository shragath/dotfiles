if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
    return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
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
            },
        },
    },
})

-- This is a snippet creator
-- s(<trigger>, <nodes>)
local s = ls.snippet

local fmt = require("luasnip.extras.fmt").fmt

-- This is an insert node
-- -- It takes a position (like $1) and optionally some default text
-- i(<position>, [default\_text])
local i = ls.insert_node
local t = ls.text_node

local rep = require("luasnip.extras").rep

require("luasnip.loaders.from_vscode").lazy_load()
ls.add_snippets("lua", {
    s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
}, { key = "lua" })
ls.add_snippets("tex", {
    s("doc", {
        t("% Ltex: language=es"),
        t({ "", "\\documentclass{" }),
        i(1, "article"),
        t({ "}", "\\usepackage[utf8]{inputenc}" }),
        -- Placeholder/Insert.
        t({ "", "\\begin{document}" }),
        t({ "", "\t" }),
        i(0),
        t({ "", "\\end{document}" }),
    }),
    s("docm", {
        t("% Ltex: language=es"),
        t({ "", "\\documentclass{" }),
        i(1, "article"),
        t({ "}", "\\usepackage[utf8]{inputenc}" }),
        t({ "", "\\usepackage{amsmath}" }),
        -- Placeholder/Insert.
        t({ "", "\\begin{document}" }),
        t({ "", "\t" }),
        i(1),
        t({ "", "\\end{document}" }),
        t({ "", "" }),
        i(0),
    }),
    s("math2", {
        t({ "\\begin{equation*}", "\t" }),
        i(1),
        t({ "", "\\end{equation*}" }),
        t({ "", "" }),
        i(0),
    }),
    s("math", {
        t("\\["),
        i(1),
        t(" \\]"),
    }),
    s("imath", {
        t("\\("),
        i(1),
        t(" \\)"),
        t({ "", "" }),
        i(0),
    }),
    s("sqrt", {
        t("\\sqrt{"),
        i(1),
        t("}"),
        i(0),
    }),
    s("frac", {
        t("\\frac{"),
        i(1),
        t("}{"),
        i(2),
        t("}"),
        i(0),
    }),
    s("int", {
        t("\\int"),
        i(1, "^a_b"),
        t(" "),
        i(0),
    }),
    s("sps", {
        t("\\text{ } "),
        i(0),
    }),
    s("lim", {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to "),
        i(2, "+\\infty"),
        t("}\tf("),
        rep(1),
        t(") = "),
        i(0),
    }),
    s("listn", {
        t("\\begin{enumerate}"),
        t({ "", "\t\\item " }),
        i(0),
        t({ "", "\\end{enumerate}" }),
    }),
    s("=>", {
        t("\\Rightarrow "),
        i(0),
    }),
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    -- s("fn", {
    --     -- Simple static text.
    --     t("//Parameters: "),
    --     -- function, first parameter is the function, second the Placeholders
    --     -- whose text it gets as input.
    --     f(copy, 2),
    --     t({ "", "function " }),
    --     -- Placeholder/Insert.
    --     i(1),
    --     t("("),
    --     -- Placeholder with initial text.
    --     i(2, "int foo"),
    --     -- Linebreak
    --     t({ ") {", "\t" }),
    --     -- Last Placeholder, exit Point of the snippet.
    --     i(0),
    --     t({ "", "}" }),
    -- }),
}, { key = "tex" })

ls.add_snippets("rust", {
    s(
        "test",
        fmt(
            [[
    #[test]
    fn {}({}) {{
        {}
    }}
    ]],
            {
                i(1, "name"),
                i(2, "parameters"),
                i(0, "code here"),
            }
        )
    ),
}, { key = "rust" })
