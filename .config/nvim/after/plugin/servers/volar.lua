---
---@param root_dir string
---@return string|nil
local function get_typescript_server_path(root_dir)
    local found_ts = ''
    local function check_dir(path)
        found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
            return path
        end
    end

    if util.search_ancestors(root_dir, check_dir) then
        return found_ts
    end

    return nil
end

require('lspconfig').volar.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    filetypes = { 'typescript', 'javascript', 'vue', 'json' },
    on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    end,
    settings = {
        documentformatting = false,
        format = { enable = false },
    }
}
