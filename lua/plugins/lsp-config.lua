local lsp_servers = {
    "lua_ls",
    "jsonls",
    "rust_analyzer",
    "pyright",
    "clangd"
}

return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = lsp_servers,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            vim.diagnostic.config({
                underline = true,
                update_in_insert = true,
                virtual_text = true,
                virtual_lines = false,
                float = {
                    focusable = false,
                    border = "rounded",
                    spacing = 4,
                    source = "if_many",
                    prefix = "● ",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                    texthl = {
                        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    },
                    numhl = {
                        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    },
                },
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            vim.tbl_deep_extend("force", capabilities, {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true,
                    },
                },
            })
            capabilities =
                vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities, true))

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            for _, lsp_server in pairs(lsp_servers) do
                lsp_server = vim.split(lsp_server, "@")[1]
                local ok, conf_opts = pcall(require, "lsp." .. lsp_server)
                if not ok then
                    goto continue
                end
                vim.lsp.config(lsp_server, conf_opts)
                ::continue::
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    if not client then
                        return
                    end

                    vim.lsp.document_color.enable(true, bufnr, { style = "virtual" })

                    if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local under_cursor_highlights_group = vim.api.nvim_create_augroup("xue/cursor_highlights",
                            { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
                            group = under_cursor_highlights_group,
                            desc = "Highlight references under the cursor",
                            buffer = bufnr,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
                            group = under_cursor_highlights_group,
                            desc = "Clear highlight references",
                            buffer = bufnr,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                    -- vim.lsp.linked_editing_range.enable()
                    -- vim.lsp.on_type_formatting.enable()

                    if client and client.name == "eslint" then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            group = vim.api.nvim_create_augroup("eslintFix", { clear = true }),
                            callback = function()
                                if vim.fn.exists(":LspEslintFixAll") > 0 then
                                    vim.cmd("LspEslintFixAll")
                                end
                            end,
                        })
                    end
                end
            })
        end
    },
}
