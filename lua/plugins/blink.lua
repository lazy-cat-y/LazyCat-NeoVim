local misc = require("utils.misc")

return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "lazy.nvim",          words = { "LazyVim" } },
            },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        lazy = true,
        dependencies = { { "rafamadriz/friendly-snippets", lazy = true } },
        config = function()
            local ls = require("luasnip")
            ls.config.setup({
                enable_autosnippets = true,
                history = true,
                updateevents = "TextChanged,TextChangedI",
                delete_check_events = "TextChanged",
                region_check_events = "CursorMoved",
            })
            -- ls.filetype_extend("<luasnip-filetype>", { "<collection-filetype>" })
            -- ls.filetype_extend("typescript", { "javascript" })
            -- ls.filetype_extend("javascriptreact", { "javascript" })
            -- ls.filetype_extend("typescriptreact", { "javascript" })

            vim.tbl_map(function(type)
                require("luasnip.loaders.from_" .. type).lazy_load()
            end, { "vscode", "snipmate", "lua" })
        end
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local clang_format_config = {
                filetypes = { "c", "cpp", "cs", "cuda", "proto" },
            }

            local M = {
                formatting.clang_format.with(clang_format_config),
                formatting.stylua
            }

            null_ls.setup({
                debug = false,
                sources = M
                -- {
                --     -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
                --     -- formatting.black.with({ extra_args = { "--fast" } }),
                --     formatting.stylua,
                --     -- formatting.clang_format.with({ extra_args = { "--style=file" }, })
                --     -- diagnostics.flake8
                -- },
            })
        end
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            { "xzbdmw/colorful-menu.nvim", opts = {} },
            "onsails/lspkind.nvim",
            "fang2hou/blink-copilot"
        },
        build = "cargo build --release",
        events = { "InsertEnter", "CmdlineEnter" },
        opts =
        {
            fuzzy = {
                implementation = "prefer_rust",
                sorts = {
                    function(a, b)
                        local sort = require("blink.cmp.fuzzy.sort")
                        if a.source_id == "spell" and b.source_id == "spell" then
                            return sort.label(a, b)
                        end
                    end,
                    "score",
                    "kind",
                    "label",
                },
            },
            signature = {
                enabled = true,
                window = { show_documentation = true, border = vim.g.bordered and "rounded" or "none" },
            },
            completion = {
                ghost_text = {
                    enabled = true,
                },
                menu = {
                    scrollbar = false,
                    border = {
                        { "󱐋", "WarningMsg" },
                        "─",
                        "╮",
                        "│",
                        "╯",
                        "─",
                        "╰",
                        "│",
                    } or vim.o.winborder or nil,
                    draw = {
                        columns = {
                            { "kind_icon", "label", gap = 1 },
                            { "kind" },
                        },
                        treesitter = { "lsp" },
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    return misc.get_kind_icon(ctx).text
                                end,
                                highlight = function(ctx)
                                    return misc.get_kind_icon(ctx).highlight
                                end,
                            },
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                            source_name = {
                                text = function(ctx)
                                    return " " .. "[" .. ctx.source_name .. "]"
                                end,
                                highlight = function()
                                    return "Comment"
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = {
                            { "", "DiagnosticHint" },
                            "─",
                            "╮",
                            "│",
                            "╯",
                            "─",
                            "╰",
                            "│",
                        } or vim.o.winborder or nil,
                    }
                },
                list = {
                    selection = {
                        preselect = function(ctx)
                            return not require('blink.cmp').snippet_active({ direction = 1 })
                        end,
                    }
                }
            },
            cmdline = {
                enabled = true,
                keymap = {
                    preset = "enter",
                    ['<Tab>'] = { 'show_and_insert', 'select_next' }
                },
                completion = {
                    ghost_text = { enabled = true },
                    list = { selection = { preselect = false, auto_insert = true } },
                    menu = { auto_show = true },
                },
            },
            snippets = { preset = "luasnip" },
            keymap = {
                preset = 'none',

                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

                ["<Tab>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    'snippet_forward',
                    'fallback'
                },
            },
            sources = {
                default = { "lsp", "snippets", "buffer", "path", "copilot", "lazydev" },
                providers = {
                    lsp = {
                        score_offset = 1000,
                    },
                    snippets = {
                        score_offset = 950,
                    },
                    buffer = {
                        score_offset = 900,
                    },
                    path = {
                        score_offset = 0,
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        async = true,
                        score_offset = 100,
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                        enabled = function(ctx)
                            return vim.bo.filetype == "lua"
                        end
                    },
                }
            },
        },
    }
}
