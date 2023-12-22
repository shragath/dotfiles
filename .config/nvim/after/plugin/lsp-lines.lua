require("lsp_lines").setup()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true }
})

local lsp_lines_toggle_custom = true
vim.keymap.set({ 'n', 'i' }, '<leader>h', function()
    if lsp_lines_toggle_custom then
        vim.diagnostic.config({
            virtual_text = true,
            vim.diagnostic.config({ virtual_lines = false })
        })
        lsp_lines_toggle_custom = false
    else
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = { only_current_line = true }
        })
        lsp_lines_toggle_custom = true
    end
end, { silent = true, remap = true, desc = "Toggle lsp_lines" })
