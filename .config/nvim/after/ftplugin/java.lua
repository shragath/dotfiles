-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.tabstop = 2        -- 1 tab == 2 spaces
vim.opt.softtabstop = 2    -- Set tab options for vim
vim.opt.shiftwidth = 2     -- Shift 2 spaces when tab

function SearchFileBackwards(fn)
    local fp = vim.fn.expand('%:p')
    local pos = #fp
    local pom = ""
    while pos > 0 do
        if fp:sub(pos, pos) == '/' then
            pom = fp:sub(1, pos) .. fn
            if vim.fn.filereadable(pom) == 1 then
                break
            end
        end
        pos = pos - 1
    end
    return pom
end

function BuildMavenProject()
    local pom = SearchFileBackwards("pom.xml")
    if pom ~= "" then
        vim.fn.system('mvn -f ' .. pom .. ' compile')
    else
        vim.api.nvim_echo({ { "No pom.xml found.", "WarningMsg" } }, true, {})
    end
end

vim.api.nvim_buf_set_keymap(0, "n", "<F8>", ":lua BuildMavenProject()<CR>", { silent = true })
-- vim.api.nvim_command('autocmd BufWritePost *.java lua BuildMavenProject()')
