local gh = function(repo)
    return "https://github.com/" .. repo
end

local cb = function(repo)
    return "https://codeberg.org/" .. repo
end

local add = vim.pack.add

local now_if_args, later, on_filetype = Config.now_if_args, Config.later, Config.on_filetype

-- Tree-sitter ================================================================
now_if_args(function()
    local ts_update = function()
        vim.cmd("TSUpdate")
    end
    Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")
    add({
        gh("nvim-treesitter/nvim-treesitter"),
        gh("nvim-treesitter/nvim-treesitter-textobjects"),
    })

  -- Ensure installed
  --stylua: ignore
  local ensure_languages = {
    'bash',       'c',    'cpp',   'css',  'diff', 'gitcommit',  'go',  'html',
    'javascript', 'json', 'julia', 'nu',   'php',  'python',     'r',
    'regex',      'rst',  'rust',  'toml', 'tsx',  'typescript', 'vhs', 'yaml',
  }
    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
    end
    local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
    if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
    end

    -- Ensure enabled
    local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
    vim.list_extend(filetypes, { "checkhealth", "markdown", "quarto" })
    local ts_start = function(ev)
        vim.treesitter.start(ev.buf)
    end
    Config.new_autocmd("FileType", filetypes, ts_start, "Ensure enabled tree-sitter")

    -- Miscellaneous adjustments
    vim.treesitter.language.register("markdown", "quarto")
    vim.filetype.add({
        extension = { qmd = "quarto", Qmd = "quarto" },
    })
end)

-- Language server configurations =============================================
now_if_args(function()
    -- Enable LSP only on Neovim>=0.11 as it introduced `vim.lsp.config`
    if vim.fn.has("nvim-0.11") == 0 then
        return
    end

    add({ gh("neovim/nvim-lspconfig") })

    -- Do not enable R language server in Quarto files
    vim.lsp.config("r_language_server", { filetypes = { "r", "rmd" } })

    -- All language servers are expected to be installed with 'mason.nvim'
    vim.lsp.enable({
        -- 'air',
        "clangd",
        -- 'emmet_ls',
        -- 'emmylua_ls',
        "gopls",
        "intelephense",
        "lua_ls",
        -- "nushell",
        "pyright",
        -- "r_language_server",
        "rust_analyzer",
        -- 'ts_ls',
        -- 'vtsls',
    })
end)

-- colorscheme ================================================================
now_if_args(function()
    add({ gh("rebelot/kanagawa.nvim") })

    require("kanagawa").setup({
        theme = "wave",
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        colors = {
            theme = {
                wave = {
                    ui = {
                        bg = "#011627",
                        -- bg_dim = '#011627',
                        bg_gutter = "#011627",
                    },
                    diag = {
                        error = "#ebbcba", -- extended color 1
                    },
                },
            },
        },
        overrides = function(colors)
            local theme = colors.theme
            return {
                -- NormalFloat = { bg = "none" },
                -- FloatBorder = { bg = "none" },
                -- FloatTitle = { bg = "none" },

                -- Save an hlgroup with dark background and dimmed foreground
                -- so that you can use it where your still want darker windows.
                -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                -- Popular plugins that open floats will link to NormalFloat by default;
                -- set their background accordingly if you wish to keep them dark and borderless
                -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                --
                -- CursorLineNr & CursorLine colors
                -- cursorline = { bg = 'none' },
                CursorLineNr = { fg = "#9ccfd8" },
                LspInlayHint = { bg = "#011627", fg = "#727169" },
                IncSearch = { bg = "#536878", fg = "#16161D" },
            }
        end,
    })
    vim.o.cursorline = true
    vim.cmd.colorscheme("kanagawa")
end)

-- Formatting =================================================================
later(function()
    add({ gh("stevearc/conform.nvim") })

    require("conform").setup({
        default_format_opts = {
            -- Allow formatting from LSP server if no dedicated formatter is available
            lsp_format = "fallback",
        },
        -- Map of filetype to formatters
        formatters_by_ft = {
            javascript = { "prettier" },
            json = { "prettier" },
            lua = { "stylua" },
            python = { "black" },
            r = { "air" },
        },
    })

    vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true })
    end, { desc = "[F]ormat buffer" })
end)

-- Filetype: markdown =========================================================
on_filetype("markdown", function()
    local build = function()
        vim.cmd.packadd("markdown-preview.nvim")
        vim.fn["mkdp#util#install"]()
    end
    Config.on_packchanged("markdown-preview.nvim", { "install", "update" }, build, "Build markdown-preview")
    add({ gh("iamcco/markdown-preview.nvim") })

    -- Do not close the preview tab when switching to other buffers
    vim.g.mkdp_auto_close = 0
end)

-- Filetype: java =========================================================
on_filetype("java", function()
    add({
        {
            src = gh("JavaHello/spring-boot.nvim"),
            version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
        },
        gh("MunifTanjim/nui.nvim"),
        gh("mfussenegger/nvim-dap"),

        gh("nvim-java/nvim-java"),
    })

    require("java").setup()
    vim.lsp.enable("jdtls")
end)

-- undotree ===================================================================
later(function()
    add({ gh("mbbill/undotree") })
    vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
end)

-- guess ident ================================================================
later(function()
    add({ gh("nmac427/guess-indent.nvim") })
end)

-- write file as sudo =========================================================
later(function()
    add({ gh("lambdalisue/suda.vim") })
end)

-- write file as sudo =========================================================
later(function()
    add({ gh("lukas-reineke/indent-blankline.nvim") })
    require("ibl").setup({
        indent = { char = "╎" }, --"│"
        whitespace = { remove_blankline_trail = true },
        scope = { enabled = true, char = "┊", show_start = false },
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_trailing_blankline_indent = true,
        -- show_current_context_start = false,
        exclude = {
            filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        },
    })
end)

-- lint =======================================================================
later(function()
    add({ gh("mfussenegger/nvim-lint") })

    local lint = require("lint")
    lint.linters_by_ft = {
        markdown = { "markdownlint" }, -- Make sure to install `markdownlint` via mason / npm
    }

    -- To allow other plugins to add linters to require('lint').linters_by_ft,
    -- instead set linters_by_ft like this:
    -- lint.linters_by_ft = lint.linters_by_ft or {}
    -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
    --
    -- However, note that this will enable a set of default linters,
    -- which will cause errors unless these tools are available:
    -- {
    --   clojure = { "clj-kondo" },
    --   dockerfile = { "hadolint" },
    --   inko = { "inko" },
    --   janet = { "janet" },
    --   json = { "jsonlint" },
    --   markdown = { "vale" },
    --   rst = { "vale" },
    --   ruby = { "ruby" },
    --   terraform = { "tflint" },
    --   text = { "vale" }
    -- }
    --
    -- You can disable the default linters by setting their filetypes to nil:
    -- lint.linters_by_ft['clojure'] = nil
    -- lint.linters_by_ft['dockerfile'] = nil
    -- lint.linters_by_ft['inko'] = nil
    -- lint.linters_by_ft['janet'] = nil
    -- lint.linters_by_ft['json'] = nil
    -- lint.linters_by_ft['markdown'] = nil
    -- lint.linters_by_ft['rst'] = nil
    -- lint.linters_by_ft['ruby'] = nil
    -- lint.linters_by_ft['terraform'] = nil
    -- lint.linters_by_ft['text'] = nil

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
            -- Only run the linter in buffers that you can modify in order to
            -- avoid superfluous noise, notably within the handy LSP pop-ups that
            -- describe the hovered symbol using Markdown.
            if vim.bo.modifiable then
                lint.try_lint()
            end
        end,
    })
end)

later(function()
    add({ gh("folke/trouble.nvim") })
    require("trouble").setup({})
    vim.keymap.set("n", "<Leader>xx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Trouble diagnostics toggle" })
    vim.keymap.set(
        "n",
        "<Leader>xX",
        "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
        { desc = "Buffer Diagnostics (Trouble)" }
    )
    vim.keymap.set("n", "<Leader>cs", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
    vim.keymap.set(
        "n",
        "<Leader>cl",
        "<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
        { desc = "LSP Definitions / references / ... (Trouble)" }
    )
    vim.keymap.set("n", "<Leader>xL", "<CMD>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
    vim.keymap.set(
        "n",
        "<Leader>xQ",
        "<CMD>Trouble diagnostics toggleTrouble qflist toggle<CR>",
        { desc = "Quickfix List (Trouble)" }
    )
end)

-- Make http requests from within neovim ======================================
later(function()
    add({ gh("mistweaverco/kulala.nvim") })
    require("kulala").setup({})
end)

-- tmux nav ===================================================================
later(function()
    add({ gh("christoomey/vim-tmux-navigator") })
    vim.keymap.set("n", "<A-h>", "<CMD>NavigatorLeft<CR>", { desc = "Tmux pane navigator left" })
    vim.keymap.set("n", "<A-l>", "<CMD>NavigatorRight<CR>", { desc = "Tmux pane navigator right" })
    vim.keymap.set("n", "<A-k>", "<CMD>NavigatorUp<CR>", { desc = "Tmux pane navigator up" })
    vim.keymap.set("n", "<A-j>", "<CMD>NavigatorDown<CR>", { desc = "Tmux pane navigator down" })
    vim.keymap.set("n", "<A-p>", "<CMD>NavigatorPrevious<CR>", { desc = "Tmux pane navigator previous" })
end)

-- cursor =====================================================================
later(function()
    add({ gh("folke/flash.nvim") })
    require("flash").setup({})
    vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("flash").jump()
    end, { desc = "Flash" })

    vim.keymap.set({ "n", "x", "o" }, "S", function()
        require("flash").treesitter()
    end, { desc = "Flash Treesitter" })

    vim.keymap.set({ "o" }, "r", function()
        require("flash").remote()
    end, { desc = "Remote Flash" })

    vim.keymap.set({ "x", "o" }, "R", function()
        require("flash").treesitter_search()
    end, { desc = "Treesitter Search" })

    vim.keymap.set({ "c" }, "<c-s>", function()
        require("flash").toggle()
    end, { desc = "FlToggle Flash Searchsh" })
end)

--
later(function()
    add({ gh("HiPhish/rainbow-delimiters.nvim") })

    -- This module contains a number of default definitions
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
        strategy = {
            [""] = rainbow_delimiters.strategy["global"],
            commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
            [""] = "rainbow-delimiters",
            lua = "rainbow-blocks",
        },
        highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
        },
        blacklist = { "c", "cpp" },
    }
end)

later(function()
    add({ gh("rachartier/tiny-inline-diagnostic.nvim") })
    require("tiny-inline-diagnostic").setup({
        options = {
            multilines = {
                enabled = true,
                always_show = false,
            },
        },
    })
    vim.diagnostic.config({ virtual_text = false })
end)
