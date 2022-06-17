--Allow filetype plugins and syntax highlighting
vim.o.autoindent = true

--Expand tab to spaces
vim.o.expandtab = true

--Incremental live completion
vim.o.inccommand = "nosplit"

--Change backspace to behave more intuitively
vim.o.backspace = "indent,eol,start"

--Set tab options for vim
vim.o.tabstop = 8
vim.o.softtabstop = 4

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Set show command
vim.o.showcmd = true

--Save undo history
vim.o.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

vim.g.completion_trigger_keyword_length = 3 --default = 1

-- These preferences clear some gruvbox background colours, allowing
-- transparency
vim.api.nvim_command([[
  augroup ColorschemePreferences
    autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
  augroup END
]])

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--vim.g.gruvbox_terminal_italics = 2
vim.o.background = "dark"
vim.cmd[[colorscheme onedark]]

-- directory managmeent, including autochdir
vim.cmd[[nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>]]
vim.cmd[[autocmd BufEnter * silent! Glcd ]]

-- Vim polyglot language specific settings
vim.g.python_highlight_space_errors = 0

-- Change preview window location
vim.g.splitright = true

-- Set completeopt to have a better completion experience "menuone,noinsert,noselect"
vim.o.completeopt="menu,menuone,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

vim.g.python3_host_prog = "C:/Users/shrag/AppData/Local/Programs/Python/Python39/python.EXE"

-- Chain completion list
vim.g.completion_chain_complete_list = {
            default = {
              default = {
                  { complete_items = { 'lsp', 'snippet' }},
                  { mode = '<c-p>'},
                  { mode = '<c-n>'}},
              comment = {},
              string = { { complete_items = { 'path' }} }}}

--Add move line shortcuts
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})

--Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true})

-- Snippets
-- " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
-- " - https://github.com/nvim-lua/completion-nvim
vim.g.UltiSnipsExpandTrigger = "<C-e>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-r>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-t>"
vim.g.UltiSnipsRemoveSelectModeMappings = 0

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

-- Deletes extra spaces at end of lines
vim.api.nvim_set_keymap('n', '<Space>ed', ':lua ToggleNetrw()<cr><paste>', { noremap = true, silent = true })

-- Highlight on yank
vim.cmd([[
  au TextYankPost * silent! lua vim.highlight.on_yank()
]])

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

-- Nerdtree like sidepanel
-- absolute width of netrw window
vim.g.netrw_winsize = -28

-- do not display info on the top of window
vim.g.netrw_banner = 0

-- variable for use by ToggleNetrw function
vim.g.NetrwIsOpen = 0

-- Lexplore toggle function
ToggleNetrw = function()
  if vim.g.NetrwIsOpen == 1 then
    local i = vim.api.nvim_get_current_buf()
    while i >= 1 do
      if vim.bo.filetype == "netrw" then
        vim.cmd([[ silent exe "bwipeout " . ]] .. i )
      end
      i = i - 1
    end
    vim.g.NetrwIsOpen = 0
    vim.g.netrw_liststyle = 0
    vim.g.netrw_chgwin = -1
  else
    vim.g.NetrwIsOpen = 1
    vim.g.netrw_liststyle = 3
    vim.cmd([[silent Lexplore]])
  end
end

-- Nerdtree file explorer
vim.api.nvim_set_keymap('n', '<Space>ed', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>ef', ':NERDTreeFind<CR>', { noremap = true, silent = true })

vim.g.gutentags_file_list_command = 'fd'
vim.g.gutentags_ctags_extra_args = { '--python-kinds=-iv' }

vim.g.indentLine_faster = 1
vim.g.indentLine_setConceal = 2
vim.g.indentLine_concealcursor = ""
vim.g.indentLine_bufNameExclude = { "term:.*" }

-- Compe keybinds
vim.api.nvim_set_keymap('i', '<C-Space>', ':call compe#complete()', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<CR>', ':call compe#confirm("<CR>")', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', ':call compe#close("<C-e>")', { noremap = true, silent = true })

