local now, now_if_args, later = Config.now, Config.now_if_args, Config.later

now(function()
    local statusline = require("mini.statusline")
    -- set use_icons to true if you have a Nerd Font
    statusline.setup({ use_icons = vim.g.have_nerd_font })

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
        return "%2l:%-2v"
    end
end)

later(function()
    require("mini.extra").setup()
end)

later(function()
    require("mini.cursorword").setup()
end)

later(function()
    require("mini.diff").setup()
end)

later(function()
    require("mini.doc").setup()
end)

later(function()
    require("mini.comment").setup()
end)

later(function()
    require("mini.splitjoin").setup()
end)

later(function()
    require("mini.surround").setup()
end)

later(function()
    require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = false } })
end)

later(function()
    local ai = require("mini.ai")
    ai.setup({
        custom_textobjects = {
            B = MiniExtra.gen_ai_spec.buffer(),
            F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
            o = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),
        },
        search_method = "cover",
    })
end)

later(function()
    local hipatterns = require("mini.hipatterns")
    local hi_words = MiniExtra.gen_highlighter.words
    hipatterns.setup({
        highlighters = {
            fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
            hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
            todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
            note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
end)

later(function()
    local miniclue = require("mini.clue")
  --stylua: ignore
  miniclue.setup({
    clues = {
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.square_brackets(),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    triggers = {
      { mode = { 'n', 'x' }, keys = '<Leader>' }, -- Leader triggers
      { mode =   'n',        keys = '\\' },       -- mini.basics
      { mode = { 'n', 'x' }, keys = '[' },        -- mini.bracketed
      { mode = { 'n', 'x' }, keys = ']' },
      { mode =   'i',        keys = '<C-x>' },    -- Built-in completion
      { mode = { 'n', 'x' }, keys = 'g' },        -- `g` key
      { mode = { 'n', 'x' }, keys = "'" },        -- Marks
      { mode = { 'n', 'x' }, keys = '`' },
      { mode = { 'n', 'x' }, keys = '"' },        -- Registers
      { mode = { 'i', 'c' }, keys = '<C-r>' },
      { mode =   'n',        keys = '<C-w>' },    -- Window commands
      { mode = { 'n', 'x' }, keys = 's' },        -- `s` key
      { mode = { 'n', 'x' }, keys = 'z' },        -- `z` key
    },
  })
end)

later(function()
    require("mini.indentscope").setup({
        -- Draw options
        draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 100,
            -- Animation rule for scope's first drawing. A function which, given
            -- next and total step numbers, returns wait time (in ms). See
            -- |MiniIndentscope.gen_animation| for builtin options. To disable
            -- animation, use require('mini.indentscope').gen_animation.none().
            animation = require("mini.indentscope").gen_animation.none(),
            -- Symbol priority. Increase to display on top of more symbols.
            priority = 2,
        },
        -- Module mappings. Use '' (empty string) to disable one.
        mappings = {
            -- Textobjects
            object_scope = "ii",
            object_scope_with_border = "ai",
            -- Motions (jump to respective border line; if not present - body line)
            goto_top = "[i",
            goto_bottom = "]i",
        },
        -- Options which control scope computation
        options = {
            -- Type of scope's border: which line(s) with smaller indent to
            -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
            border = "both",
            -- Whether to use cursor column when computing reference indent.
            -- Useful to see incremental scopes with horizontal cursor movements.
            indent_at_cursor = true,
            -- Whether to first check input line to be a border of adjacent scope.
            -- Use it if you want to place cursor on function header to get scope of
            -- its body.
            try_as_border = true,
        },
        -- Which character to use for drawing scope indicator
        symbol = "╎",
    })
end)
