-- LSP servers
return {
    { 'williamboman/mason.nvim',          build = ":MasonUpdate" },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'simrat39/rust-tools.nvim' },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local ok, wf = pcall(require, "vim.lsp._watchfiles")
            if ok then
                -- disable lsp watcher. Too slow on linux
                wf._watchfunc = function()
                    return function() end
                end
            end
            require('neodev').setup()
        end
    },
    {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup {
                formatters_by_ft = {
                    -- lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    -- python = { "isort", "black" },
                    -- Use a sub-list to run only the first available formatter
                    javascript = { "prettierd", "prettier" },
                    javascriptreact = { "prettierd", "prettier" },
                    typescript = { "prettierd", "prettier" },
                    typescriptreact = { "prettierd", "prettier" },
                    vue = { "prettierd", "prettier" },
                    xml = { "xmllint" },
                    java = { "google-java-format" },
                },
            }
            vim.keymap.set({ 'n', 'v' }, '<space>f', '<cmd>Format<cr>', { desc = "Format code" })
        end
    },
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     config = function(_, opts) require 'lsp_signature'.setup(opts) end
    -- },
    { 'onsails/lspkind-nvim', lazy = true },
}
