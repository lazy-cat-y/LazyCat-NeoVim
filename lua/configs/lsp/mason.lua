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
    automatic_enable = false,
})

local lspconfig_status_ok, _ = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

for _, server in pairs(servers) do
    server = vim.split(server, "@")[1]
    local opts = {
        on_attach = require("configs.lsp.handlers").on_attach,
        capabilities = require("configs.lsp.handlers").capabilities,
    }
    local ok, conf_opts = pcall(require, "configs.lsp.settings." .. server)
    if ok then opts = vim.tbl_deep_extend("force", opts, conf_opts) end
    vim.lsp.config(server, conf_opts)
end
