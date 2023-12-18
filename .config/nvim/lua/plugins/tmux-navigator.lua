-- tmux
return {
    'christoomey/vim-tmux-navigator',
    keys = {
        { '<A-h>', '<CMD>NavigatorLeft<CR>',     desc = "Tmux pane navigator left" },
        { '<A-l>', '<CMD>NavigatorRight<CR>',    desc = "Tmux pane navigator right" },
        { '<A-k>', '<CMD>NavigatorUp<CR>',       desc = "Tmux pane navigator up" },
        { '<A-j>', '<CMD>NavigatorDown<CR>',     desc = "Tmux pane navigator down" },
        { '<A-p>', '<CMD>NavigatorPrevious<CR>', desc = "Tmux pane navigator previous" },
    }
}
