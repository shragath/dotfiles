-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = 'a'                                     -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'                       -- Copy/paste to system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Auto complete options
vim.g.loaded_netrw = 1                                  -- Turn off file explorer netrw
vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.snippets = "luasnip"
vim.opt.swapfile = false -- Don't use swap file
vim.opt.backup = false
-- vim.g.mapleader = "\"
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.spelllang = "en_us"
vim.opt.spell = false
vim.g.loaded_spellfile_plugin = 0

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.guicursor = ""
vim.opt.number = true                       -- Show line number
vim.opt.relativenumber = true
vim.opt.showmatch = true                    -- Highlight matching parenthesis
vim.opt.foldmethod = 'marker'               -- Enable folding (default 'foldmarker')
vim.opt.colorcolumn = '80'                  -- Line lenght marker at 80 columns
vim.opt.splitright = true                   -- Vertical split to the right
vim.opt.splitbelow = true                   -- Orizontal split to the bottom
vim.opt.ignorecase = true                   -- Ignore case letters when search
vim.opt.smartcase = true                    -- Ignore lowercase for the whole pattern
vim.opt.linebreak = true                    -- Wrap on word boundary
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
vim.o.cursorline = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.tabstop = 4        -- 1 tab == 4 spaces
vim.opt.softtabstop = 4    -- Set tab options for vim
vim.opt.shiftwidth = 4     -- Shift 4 spaces when tab
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true     -- Enable background buffers
vim.opt.history = 100     -- Remember N lines in history
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.synmaxcol = 240   -- Max column for syntax highlight
vim.opt.updatetime = 50   -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience

-- Incremental live completion
vim.o.inccommand = "nosplit"

-- Change backspace to behave more intuitively
vim.o.backspace = "indent,eol,start"

-- Enable break indent
vim.o.breakindent = true

-- Set show command
vim.o.showcmd = true

-- vim.g.user_emmet_leader_key = '<C-Z>'
--
-- -- Custom plugin config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
