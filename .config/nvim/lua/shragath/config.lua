-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
vim.opt.swapfile = false -- Don't use swapfile
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Autocomplete options
-- vim.g.loaded_netrw = 1 -- Turn off file explorer netrw
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.snippets = "luasnip"
vim.opt.swapfile = false
vim.opt.backup = false

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.guicursor = ""
vim.opt.number = true -- Show line number
vim.opt.showmatch = true -- Highlight matching parenthesis
vim.opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
vim.opt.colorcolumn = '80' -- Line lenght marker at 80 columns
vim.opt.splitright = true -- Vertical split to the right
vim.opt.splitbelow = true -- Orizontal split to the bottom
vim.opt.ignorecase = true -- Ignore case letters when search
vim.opt.smartcase = true -- Ignore lowercase for the whole pattern
vim.opt.linebreak = true -- Wrap on word boundary
vim.g.completion_trigger_keyword_length = 3 -- default = 1
-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cmdheight = 1 -- Give more space for displaying messages
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.errorbells = false
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.tabstop = 4 -- 1 tab == 4 spaces
vim.opt.softtabstop = 4 -- Set tab options for vim
vim.opt.shiftwidth = 4 -- Shift 4 spaces when tab
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true -- Enable background buffers
vim.opt.history = 100 -- Remember N lines in history
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.synmaxcol = 240 -- Max column for syntax highlight
vim.opt.updatetime = 50 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
-- Rust Cargo run  shellescape(@%, 1)
local r_group = vim.api.nvim_create_augroup("RustCompile", { clear = true })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", callback = function()
    vim.keymap.set('i', '<F9>', '<esc><cmd>w<cr><cmd>exec "!cargo run"<cr>')
    vim.keymap.set('n', '<F9>', '<cmd>w<cr><cmd>exec "!cargo run"<cr>')
    vim.keymap.set('n', '<F10>', '<esc><cmd>w<cr><cmd>exec "!cargo run --bin" expand("%:t:r")<cr>')
end, group = r_group })

-----------------------------------------------------------
-- Latex
-----------------------------------------------------------
vim.g.vimtex_view_method = 'zathura'
vim.g.tex_flavor = 'latex'

-----------------------------------------------------------
-- Allow filetype plugins and syntax highlighting
-- vim.o.autoindent = true

-- Incremental live completion
vim.o.inccommand = "nosplit"

-- Change backspace to behave more intuitively
vim.o.backspace = "indent,eol,start"


-- Enable break indent
vim.o.breakindent = true

-- Set show command
vim.o.showcmd = true


-- Format on save
-- vim.cmd [[autocmd BufWritePre *.* lua vim.lsp.buf.formatting_sync()]]

-- Change blade.php to html filetype
-- vim.cmd([[autocmd BufRead,BufNewFile *.blade.php set filetype=html]])

-- Python 3 path
vim.g.python3_host_prog = "/usr/bin/python3"

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

---vim.g.python3_host_prog = "C:/Users/shrag/AppData/Local/Programs/Python/Python39/python.EXE"

-- Chain completion list
vim.g.completion_chain_complete_list = {
    default = {
        default = {
            {
                complete_items = { 'lsp', 'snippet' }
            }, {
                mode = '<c-p>'
            }, {
                mode = '<c-n>'
            }
        },
        comment = {},
        string = {
            {
                complete_items = { 'path' }
            }
        }
    }
}

vim.g.indentLine_faster = 1
vim.g.indentLine_setConceal = 2
vim.g.indentLine_concealcursor = ""
vim.g.indentLine_bufNameExclude = { "term:.*" }

vim.g.user_emmet_leader_key = '<C-Z>'

-- Custom plugin config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
