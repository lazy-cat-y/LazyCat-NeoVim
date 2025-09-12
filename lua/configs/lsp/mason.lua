local servers = {
    "lua_ls",
    "pyright",
    "jsonls",
    "rust_analyzer",
    "clangd",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities and client.server_capabilities.inlayHintProvider and client.server_capabilities.inlayHintProvider.resolveProvider then
            local v = ev.data.params.value
            if v.kind == "end" then
                vim.schedule(function()
                    vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
                end)
            end
        end
    end,
})

vim.lsp.handlers['client/registerCapability'] = (function(overridden)
    return function(err, res, ctx)
        local result = overridden(err, res, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if not client then
            return
        end
        for bufnr, _ in pairs(client.attached_buffers) do
            -- Call your custom on_attach logic...
            -- my_on_attach(client, bufnr)
        end
        return result
    end
end)(vim.lsp.handlers['client/registerCapability'])

for _, server in pairs(servers) do
    server = vim.split(server, "@")[1]
    local ok, conf_opts = pcall(require, "configs.lsp.settings." .. server)
    if not ok then
        goto continue
    end
    vim.lsp.config(server, conf_opts)
    ::continue::
end
