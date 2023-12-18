-- nvim-treesitter
return {
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/playground',      cmd = "TSPlaygroundToggle" },
    'nvim-treesitter/nvim-treesitter-context',
}
