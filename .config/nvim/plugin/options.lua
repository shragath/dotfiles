local opt = vim.opt

----- Interesting Options -----

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences -----
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.number = true
opt.relativenumber = true

-- Configure how new splits should be opened
opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.swapfile = false

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.more = false

opt.foldmethod = "manual"

opt.cmdheight = 1 -- default 1

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Save undo history
vim.o.undofile = true

-- Undo\\ Redo
opt.undofile = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Indentation guides
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', eol = '↴', precedes = '«', extends = '»', lead = '·' }
